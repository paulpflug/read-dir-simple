fs = require('fs')
path = require('path')

exports = (dir, encoding) -> 
  result = {};
  if typeof encoding != "string" 
    encoding = null
  entries = fs.readdirSync(dir);
  for entry in entries
    entryPath = path.join(dir, entry);
    if not fs.statSync(entryPath).isDirectory()
      result[entry] = fs.readFileSync(entryPath, encoding)
  return result;
