LLVM_VERSION="9.0.1"

echo "Setup starting..."

which cmake
which g++
which python
gcc --version
g++ --version

mkdir "C:\libs"

# build static version of LLVM
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-$LLVM_VERSION/llvm-$LLVM_VERSION.src.tar.xz
tar xf llvm-$LLVM_VERSION.src.tar.xz
mkdir llvm
mv llvm-$LLVM_VERSION.src/* llvm/.
cd llvm
mkdir build
cd build
# note: on windows need to make sure we use the mingw64 version of python, not the default msys64 one:
cmake -G "Unix Makefiles" -DPYTHON_EXECUTABLE=/mingw64/bin/python -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=C:/libs -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_BUILD_TOOLS=OFF -DLLVM_INCLUDE_TOOLS=OFF -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_BUILD_TESTS=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_DOCS=OFF -DLLVM_BUILD_UTILS=OFF -DLLVM_INCLUDE_UTILS=OFF -DLLVM_INCLUDE_GO_TESTS=OFF -DLLVM_BUILD_BENCHMARKS=OFF -DLLVM_INCLUDE_BENCHMARKS=OFF -DLLVM_ENABLE_LIBPFM=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_DIA_SDK=OFF -DLLVM_BUILD_INSTRUMENTED_COVERAGE=OFF -DLLVM_ENABLE_BINDINGS=OFF -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_TERMINFO=OFF -LLVM_ENABLE_LIBXML2=OFF -DLLVM_ENABLE_WARNINGS=OFF -DLLVM_POLLY_BUILD=OFF -DLLVM_POLLY_LINK_INTO_TOOLS=OFF ..
cd ..
touch SETUP_COMPLETE
cd ..
pwd
echo "Setup complete."

