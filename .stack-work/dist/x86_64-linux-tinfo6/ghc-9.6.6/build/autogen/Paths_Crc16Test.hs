{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Crc16Test (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/bin"
libdir     = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/lib/x86_64-linux-ghc-9.6.6/Crc16Test-0.1.0.0-1OVqRDgwMcM2RYmnV1gOzI"
dynlibdir  = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/lib/x86_64-linux-ghc-9.6.6"
datadir    = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/share/x86_64-linux-ghc-9.6.6/Crc16Test-0.1.0.0"
libexecdir = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/libexec/x86_64-linux-ghc-9.6.6/Crc16Test-0.1.0.0"
sysconfdir = "/home/b_demharter/Dokumente/CRC16-polynomial-check/.stack-work/install/x86_64-linux-tinfo6/002b1d472db84ca5b8d4974d742be122e0a12986213e7512914a8fd3b2878333/9.6.6/etc"

getBinDir     = catchIO (getEnv "Crc16Test_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Crc16Test_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Crc16Test_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Crc16Test_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Crc16Test_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Crc16Test_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
