Toc = require './Toc'

module.exports =

  activate: (state) ->
    @toc = new Toc(atom.workspace.getActivePaneItem())

    atom.commands.add 'atom-workspace', 'markdown-toc-plus:create': => @toc.create()
    atom.commands.add 'atom-workspace', 'markdown-toc-plus:update': => @toc.update()
    atom.commands.add 'atom-workspace', 'markdown-toc-plus:delete': => @toc.delete()

  # deactivate: ->
  #   @toc.destroy()
