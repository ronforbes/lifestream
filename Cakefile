fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

task 'watch', 'watches the project and compiles coffescript into javascript', () ->
  coffee = spawn 'coffee', ['-cw', './']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()