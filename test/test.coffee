should = require 'should'
config = require '../src/Config'

##|
##|  Display a simple object
config.dump "Simple object output:", { a: 10, b: 20 }

describe "Credential management", ->

    it "Should be able to get the default test credentials", ->

        ##|
        ##|  Get the credentials for a test host
        mqHost = config.getCredentials "mqHost"
        mqHost.should.equal('amqp://127.0.0.1:5672')

describe "Finding files", ->

    describe "Finding files in a path list", ->

        it "Should be able to find the README file", ->
            pathList = ['./', '../']
            filename = config.FindFileInPath "README.md", pathList
            should.exist(filename)
            filename.should.equal("./README.md")

        it "Should be able to find the test file", ->
            pathList = ['./', '../', './test/', './dummy/']
            filename = config.FindFileInPath "test.coffee", pathList
            should.exist(filename)
            filename.should.equal("./test/test.coffee")

