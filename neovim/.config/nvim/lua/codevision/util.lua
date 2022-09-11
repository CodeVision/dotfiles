P = function(args)
  print(vim.inspect(args))
  return args
end

R = function(name)
  require('plenary.reload').reload_module(name)
  return require(name)
end
