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
  command : [py, '-m', 'numpy.f2py', '@INPUT@', '--build-dir', 'src']
)
py.extension_module('_fibby',
  ['fib/fib1.f', _fibby_source],
  incdir_f2py / 'fortranobject.c',
  include_directories: inc_np,
  dependencies : py_dep,
  install : true,
  subdir: 'pylam'
)

# py.install_sources(['pylam.py'],subdir: 'pylam')