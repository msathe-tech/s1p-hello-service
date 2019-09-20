import org.springframework.cloud.contract.spec.Contract

Contract.make {
    description("""
should return a hello and name
""")
    request {
        method GET()
        url "/Rockstar"
    }
    response {
        status 200
        body "Hello Rockstar!"
    }
}

