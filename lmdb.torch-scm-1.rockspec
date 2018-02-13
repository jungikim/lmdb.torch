package = "lmdb.torch"
version = "scm-1"

source = {
   url = "git://github.com/jungikim/lmdb.torch.git"
}

description = {
   summary = 'LMDB wrappers for Torch (modified from https://github.com/eladhoffer/lmdb.torch)',
   detailed = [[
   ]],
   homepage = "https://github.com/jungikim/lmdb.torch"
}

dependencies = {

}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)";
$(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
