py_mod = import('python')
py = py_mod.find_installation(pure: false)
py_dep = py.dependency()

incdir_numpy = run_command(py,
  ['-c', 'import os; os.chdir(".."); import numpy; print(numpy.get_include())'],
  check : true
).stdout().strip()

incdir_f2py = run_command(py,
    ['-c', 'import os; os.chdir(".."); import numpy.f2py; print(numpy.f2py.get_include())'],
    check : true
).stdout().strip()

inc_np = include_directories(incdir_numpy, incdir_f2py)


_fibby_source = custom_target('_fibbymodule',
  input : ['fib.pyf'],
  output : ['_fibbymodule.c', '_fibby-f2pywrappers.f'],
  command : [py, '-m', 'numpy.f2py', '@INPUT@', '--build-dir', 'src','--lower']
)
py.extension_module('_fibby',
  ['fib/fib1.f', _fibby_source],
  incdir_f2py / 'fortranobject.c',
  include_directories: inc_np,
  dependencies : py_dep,
  install : true,
  subdir: 'pylam'
)

_ivlam_source = custom_target('_ivlammodule',
  input : ['ivlam/ivLamV2p41.f90'],
  output : ['_ivlammodule.c', '_ivlam-f2pywrappers.f', '_ivlam-f2pywrappers2.f90'],
  command : [py, '-m', 'numpy.f2py', '@INPUT@','-m','_ivlam','--f2cmap','ivlam/.f2py_f2cmap', '--build-dir', 'src','--lower']
)
py.extension_module('_ivlam',
  ['ivlam/ivLamV2p41.f90', _ivlam_source],
  incdir_f2py / 'fortranobject.c',
  include_directories: inc_np,
  dependencies : py_dep,
  install : true,
  subdir: 'pylam'
)
py.install_sources(['__init__.py','ivlam.py'],subdir: 'pylam')