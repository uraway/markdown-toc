path = require 'path'

Toc = require '../lib/Toc.coffee'

describe "the markdown-toc-plus", ->
  [workspaceElement] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)

    waitsForPromise ->
      atom.workspace.open('test.md')


  describe "when the markdown-toc-plus is toggled", ->
    it "is ready for creating a table of contents", ->
      runs -> atom.commands.dispatch workspaceElement, 'markdown-toc-plus:toggle'

      editor = atom.workspace.getActiveTextEditor()
      expect(editor.getPath()).toContain 'test.md'

    it "creats TOC before an editor saves a buffer", ->
      editor.insertText("<!-- /TOC -->")
      editor.save()
      expect(editor.getText()).toBe "<!-- /TOC -->"


  describe "when Create command is toggled", ->
    it "creates a toc", ->
      runs -> atom.commands.dispatch workspaceElement, 'markdown-toc-plus:create'

      editor = atom.workspace.getActiveTextEditor()
      expect(editor.getPath()).toContain 'test.md'


  describe "when Update command is toggled", ->
    it "updates the toc", ->
      runs -> atom.commands.dispatch workspaceElement, 'markdown-toc-plus:update'

      editor = atom.workspace.getActiveTextEditor()
      expect(editor.getPath()).toContain 'test.md'


  describe "when Delete cpmmand is toggled", ->
    it "deletes the toc", ->
      runs -> atom.commands.dispatch workspaceElement, 'markdown-toc-plus:delete'

      editor = atom.workspace.getActiveTextEditor()
      expect(editor.getPath()).toContain 'test.md'
