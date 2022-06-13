# rush

Microsoft monorepo manager

<https://rushjs.io/pages/intro/welcome/>

<https://github.com/microsoft/rushstack>

```bash
# Install the NPM packages:
# (If you don't have a GitHub email configured, add the "--bypass-policy" option.)
$ rush update

# Incremental install:
$ rush update  # <-- instantaneous!

# Force all projects to be rebuilt:
$ rush rebuild

# Incremental build:
$ rush build    # <-- instantaneous!

# Use "--verbose" to view the console logs for each project as it is built.
# Projects build in parallel processes, but their logs are collated.
$ rush rebuild --verbose
```
