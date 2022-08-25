curl -L -X POST 'https://api.github.com/graphql' -H 'Authorization: Bearer xxx' -H 'Content-Type: application/json' \
    --data-raw '{"query":"query listSSOUserIdentities($organizationName: String!) {\norganization(login: $organizationName) {\nsamlIdentityProvider {\nssoUrl\nexternalIdentities(first: 100 ) {\ntotalCount\nedges {\n node {\n guid\n samlIdentity {\n nameId\n username\n givenName\n familyName\n emails {\n value\n }\n }\n user {\n login\n }\n }\n}\npageInfo {\n hasNextPage\n endCursor\n}\n}\n}\n}\n}","variables":{"organizationName":"joshjohanning-org-saml"}}'