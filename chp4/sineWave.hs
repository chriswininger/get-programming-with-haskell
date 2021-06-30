import Data.Int
import Data.ByteString.Lazy.Builder
import Data.Monoid
import System.IO

-- Audio Fn
sineWave :: Double -> Double
sineWave t = sin (t * 2 * pi)

sineWaveShift :: Double -> Double -> Double
sineWaveShift t offset = sineWave (t + offset)

applyPitch :: Double -> (Double -> Double) -> (Double -> Double)
applyPitch pitch orig = \t -> orig (t * pitch)

middleC = 261.63

audioFn = applyPitch middleC sineWave
audioFnShift = applyPitch middleC (sineWaveShift 3.0)

sampleTimes :: Double -> Double -> Double -> [Double]
sampleTimes frequency start end
    | start > end = []
    | otherwise = start:(sampleTimes frequency (start + (1.0 / frequency)) end)

sample :: (Double -> Double) -> Double -> Double -> [Double]
sample audioFn frequency duration = [audioFn t | t <- sampleTimes frequency 0 duration]

sampleInt16 :: (Double -> Double) -> Double -> Double -> [Int16]
sampleInt16 audioFn frequency duration =
  [floor (v * 32767.5) | v <- samples]
  where samples = sample audioFn frequency duration

samplesToInt16 :: [Double] -> [Int16]
samplesToInt16 samples =
  [floor (v * 32767.5) | v <- samples]


samplesAdd :: [Double]->[Double] -> [Double]
samplesAdd sample1 sample2 = zipWith (+) sample1 sample2

turnDownForWhat :: [Double] -> Double -> [Double]
turnDownForWhat samples vol = map (\val -> val*vol) samples

samplePlain1 = sample audioFn 44100.0 5
samplePlain2 = turnDownForWhat samplePlain1 0.2
--samplePlain3 = turnDownForWhat samplePlain2 0.2
--samplePlain4 = samplesAdd samplePlain2 samplePlain3
--samplePlain5 = turnDownForWhat (sample audioFnShift 44100.0 5) 0.2
--samplePlain6 = samplesAdd samplePlain4 samplePlain5

samples = samplesToInt16 samplePlain2

audioBuilder :: Builder
audioBuilder = mconcat sampleBuilders
    where sampleBuilders = map int16LE samples

main :: IO ()
main = hPutBuilder stdout audioBuilder
