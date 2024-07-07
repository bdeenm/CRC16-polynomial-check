module Main (main) where

import Data.Word
import Numeric (showHex)
import Data.Digest.CRC16

conect :: [Word8] -> Integer
conect [] = 0
conect (x:xs) = fromInteger(x)*(0x10^(length xs)) + (conect xs) 

-- Function to calculate CRC16 with a given polynomial using crc package
calculateCRC16 :: CRC16 -> [Word8] -> Word16
calculateCRC16 poly bytes = crc16UpdateList (crc16Init poly) bytes

main :: IO ()
main = do
    let dataBytes = replicate 17 0x00
    let expectedCRC = 0xECC7
    let polynomials = [ crc16IBM, crc16CCITT, crc16X25, crc16XMODEM
                      , crc16IBM3740, crc16KERMIT, crc16MODBUS, crc16USB
                      , crc16EN13757, crc16DNP, crc16TMS37157, crc16A
                      , crc16AUGCCITT, crc16BUYPASS, crc16DDS110
                      , crc16DECTR, crc16DECTX, crc16GENIBUS, crc16MAXIM
                      , crc16MCRF4XX, crc16RIELLO ]

    putStrLn "Testing common and additional CRC16 polynomials:"
    mapM_ (testPoly dataBytes expectedCRC) polynomials

testPoly :: [Word8] -> Word16 -> CRC16 -> IO ()
testPoly dataBytes expectedCRC poly = do
    let computedCRC = calculateCRC16 poly dataBytes
    putStrLn $ "Polynomial " ++ show poly ++ ": Computed CRC = 0x" ++ showHex computedCRC ""
    if computedCRC == expectedCRC
        then putStrLn " --> Match!"
        else return ()
