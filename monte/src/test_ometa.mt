def ometa := import("ometa")
def runTests := import("unittest")

def makeRuntimeTests(assert):
    def test_anything():
        def data := "foo"
        def o := ometa(data)
        for i => c in data:
            def [v, [line, col]] := o.rule_anything(null)
            assert.equal([c, [1, i]], [v, [line, col]])
        escape e:
            o.rule_anything(e)
        catch loc:
            assert.equal(loc, [1, 3])

    return [test_anything]

runTests([makeRuntimeTests])
