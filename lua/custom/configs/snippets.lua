local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
  s("log", {
    t('console.log('),
    i(1),
    t(');')
  })
})

ls.add_snippets("javascript", {
  s("logg", {
    t('console.log(\''),
    i(1),
    t('\', );')
  })
})

ls.add_snippets("javascript", {
  s("time", {
    t('console.time(\''),
    i(1),
    t('\');')
  })
})

ls.add_snippets("javascript", {
  s("timee", {
    t('console.timeEnd(\''),
    i(1),
    i(2),
    t('\');')
  })
})
