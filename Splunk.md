# Splunk

**Splunk** monitoring/observability platform

## Documentation

- [Documentation](https://docs.splunk.com/Documentation) root
- [Search](https://docs.splunk.com/Documentation/SplunkCloud/9.2.2406/Search/GetstartedwithSearch?ref=hk)
- Splunk [**Search Processing Language**](https://docs.splunk.com/Splexicon:Searchprocessinglanguage) (**SPL**)

Use the **Search & Reporting** app (a.k.a. the "Search app").

## Format the search textbox

**Linux**/**Windows**: `Ctrl + \` , `Ctrl + Shift + F`
**Mac OSX**: `⌘ + \` , `⌘ + Shift + F`

## Boolean operators

The operators must be all-caps: `AND`, `OR`, `NOT`

By default, keywords in a search are joined by `AND`

- e.g. `foo bar` is equivalent to `foo AND bar`

### Precendence

highest to lowest:

- terms inside parentheses
- `NOT`
- `OR`
- `AND`

## `AS` operator

Used to rename columns.

Same as SQL (e.g. `distinct_count(productId) AS "Total Products"`

## Field searches

Syntax: `field_name=field_value`

- `field_name` is case-sensitive
- `field_value` is case-insensitive

## Search Processing Language (SPL)

### Transforming commands

Order results into data tables that can be used in Visualizations

e.g. `chart`, `timechart`, `stats`, `top`, `rare`, `contingency`,`highlight`

## Subsearch

Subsearch is enclosed in `[]` and processed before the outer search.

Conceptually the same as a subquery in SQL.

By default, subsearches return a maximum of 10,000 results and have a maximum runtime of 60 seconds.

## Field lookups

Data that's mapped (keyed off of a field) to and included in the search results.

## Reports

The save dialog has an **Add to Dashboard** option.
