# Splunk

**Splunk** monitoring/observability platform

## Documentation

- [Documentation](https://docs.splunk.com/Documentation) root
- [Search](https://docs.splunk.com/Documentation/SplunkCloud/9.2.2406/Search/GetstartedwithSearch?ref=hk)
- Splunk [**Search Processing Language**](https://docs.splunk.com/Splexicon:Searchprocessinglanguage) (**SPL**)
- [Splunk Cheat Sheet: Query, SPL, RegEx, & Commands](https://www.splunk.com/en_us/blog/learn/splunk-cheat-sheet-query-spl-regex-commands.html)
- [Query Optimization](https://docs.splunk.com/Documentation/Splunk/9.3.1/Search/Aboutoptimization)

Use the **Search & Reporting** app (a.k.a. the "Search app").

## Search

### Format the search textbox

**Linux**/**Windows**: `Ctrl + \` , `Ctrl + Shift + F`
**Mac OSX**: `⌘ + \` , `⌘ + Shift + F`

### Boolean operators

The operators must be all-caps: `AND`, `OR`, `NOT`

By default, keywords in a search are joined by `AND`

- e.g. `foo bar` is equivalent to `foo AND bar`

#### Precendence

highest to lowest:

- terms inside parentheses
- `NOT`
- `OR`
- `AND`

### `NOT` vs `!=`

`NOT foo="bar"` will include events where `foo` is missing (i.e. no value).

`!= foo="bar"` will only include events that have a value for `foo`.

### `AS` operator

Used to rename columns.

Same as SQL (e.g. `distinct_count(productId) AS "Total Products"`

### Field searches

Syntax: `field_name=field_value`

- `field_name` is case-_sensitive_
- `field_value` is case-_insensitive_

#### Filter out records where a field does not have a value

- `foo=*` - single field
- `foo=* bar=*` - multiple fields

### Search Processing Language (SPL)

#### Transforming commands

Order results into data tables that can be used in Visualizations

e.g. `chart`, `timechart`, `stats`, `top`, `rare`, `contingency`,`highlight`

#### `rex`

Use to extract or transform fields using regex.

([source](https://docs.splunk.com/Documentation/Splunk/9.3.1/SearchReference/Rex))

### Subsearch

Subsearch is enclosed in `[]` and processed before the outer search.

Conceptually the same as a subquery in SQL.

By default, subsearches return a maximum of 10,000 results and have a maximum runtime of 60 seconds.

### Field lookups

Data that's mapped (keyed off of a field) to and included in the search results.

### Search Optimizations

- Filter on the default fields (`index`, `source`, `sourcetype`)
- Filter out as much data as possible before performing calculations on it
- Trying to filter on field/value pairs _before_ the first pipe (field/value pairs are indexed)
- Use explicit terms instead of wildcards
- Use explicit terms instead of `NOT` or `!=`
- Filter out unnecessary fields (e.g. by using `fields x y z`)
  - Not as important if used with search optimizations that already work on a definite set of fields, such as predicate pushdown and transforming commands
- Use `head` command when doing exploratory searches (e.g., `sourcetype=access_* | head 1000`)
- Use `TERM` directive on terms that contain minor, but not major, breakers (e.g. `TERM(192.0.2.255)`)

([source](https://docs.splunk.com/Documentation/Splunk/9.3.1/Search/Quicktipsforoptimization))

### Chain search

<https://docs.splunk.com/Documentation/Splunk/8.2.1/DashStudio/dsChain>

It's recommended to use a [transforming search](https://docs.splunk.com/Documentation/Splunk/8.2.1/Search/Aboutreportingcommands) as the base search.

#### Non-transforming base search

If the base search is a non-transforming search, you must explicitly state in the base search what fields will be used in the chain search using the `| fields` command (otherwise, you will get `No results returned`). The base search will be limited to the number of events specified by `max_count` setting in `limits.conf` (the default is 500,000).

#### Chaining multiple searches

To chain multiple searches, 1 hack is to have the base search do a granular count by all the fields you'll need for the various chained searches you're interested in, and then the chained searches can use `sum(count)` to get a count by a single field.

For example, if your events have fields `foo`, `bar`, `baz` & `bat`, make the parent search return `stats count by foo bar baz bat`. For a count by `bar`, you can create a chained search that does `| stats sum(count) as "count" by bar`.

```splunk
index="x" bar="y" | stats count by foo bar baz bat // base search
| where foo = "a" // chained search that filters by foo
| stats sum(count) as "count" by bar // chained search that gets a count by bar
```

## Adding a query to a Dashboard

2 options:

1. From the search, click the **Save As ⏷** button and choose _Existing Dashboard_.
2. If the query has been saved as a Report, go to the Report's page, click **Add to Dashboard ⏷**, and choose _Existing Dashboard_.

### Edit query/search

To edit the query used in a report, click the button labeled **Edit ⏷** and choose _Open in Search_

## Timechart

<https://docs.splunk.com/Documentation/Splunk/9.3.1/SearchReference/Timechart>

## Tokens

<https://docs.splunk.com/Documentation/Splunk/latest/Viz/tokens>

Use tokens to set a dynamic value that can be set via a textbox/dropdown/etc. (for example, the environment).

### Updating multiple tokens at once

In the newer **Splunk Dashboard Studio** dashboard type[^1], a trigger like a dropdown can only set 1 token at a time. Using that token, however, we
can configure a data source that sets other values.

#### Example

Say we had 3 values we wanted to set dynamically, `foo`, `bar`, and `baz`.

We use a dropdown to set a token named `foo_token`, which gives us our `foo` value.

We then create a data source named `bar_baz_values`. Inside the data source, we use the value of `foo` to set the values of `bar` and `baz`:

```splunk
| makeresults
| eval bar = case( "$foo_token$" = "A", "abc", "$foo_token$" = "B", "def", "$foo_token$" = "C", "xyz" )
| eval baz = case( "$foo_token$" = "A", 1, "$foo_token$" = "B", 3, "$foo_token$" = "C", 42 )
| fields bar baz
```

To use the values from the data source in a query, reference them as `$bar_baz_values:result.bar$` and `$bar_baz_values:result.baz$` [^2].

([source](https://help.splunk.com/en/splunk-enterprise/create-dashboards-and-reports/dashboard-studio/9.0/add-dashboard-interactions/setting-tokens-from-search-results-or-search-job-metadata))

[^1]: The style that uses JSON source code (the older one was XML).

[^2]: To be able to reference the value, the data source must have the option _Access search results or metadata_ enabled.

## Time formatting

To format the `_time` field to be more human readable, use the `strftime` command:

```splunk
source="foobar"
| eval time=strftime(_time, "%m/%d/%y %I:%M:%S %p")
| table time bat baz
```
