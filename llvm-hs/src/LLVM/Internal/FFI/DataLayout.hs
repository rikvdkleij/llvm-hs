{-# LANGUAGE
  ForeignFunctionInterface
  #-}

module LLVM.Internal.FFI.DataLayout where

import LLVM.Prelude

import Foreign.C.String
import Foreign.Ptr

import LLVM.Internal.FFI.LLVMCTypes
import LLVM.Internal.FFI.PtrHierarchy

data DataLayout

-- Oooh those wacky LLVM C-API coders: C API called DataLayout TargetData.
-- Great. Just great.

foreign import ccall unsafe "LLVMCreateTargetData" createDataLayout :: 
  CString -> IO (Ptr DataLayout)

foreign import ccall unsafe "LLVMDisposeTargetData" disposeDataLayout :: 
  Ptr DataLayout -> IO ()

foreign import ccall unsafe "LLVMCopyStringRepOfTargetData" dataLayoutToString ::
  Ptr DataLayout -> IO (OwnerTransfered CString)

foreign import ccall unsafe "LLVMABISizeOfType" getTypeAllocSize ::
  Ptr DataLayout -> Ptr Type -> IO Word64
