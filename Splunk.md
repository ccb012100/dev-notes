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

### `AS` operator

Used to rename columns.

Same as SQL (e.g. `distinct_count(productId) AS "Total Products"`

### Field searches

Syntax: `field_name=field_value`

- `field_name` is case-sensitive
- `field_value` is case-insensitive

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

## Reports

The save dialog has an **Add to Dashboard** option.

### Edit query/search

To edit the query used in a report, click the `Edit ⏷ > Open in Search`

## Timechart

<https://docs.splunk.com/Documentation/Splunk/9.3.1/SearchReference/Timechart>
