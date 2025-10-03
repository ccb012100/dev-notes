# uBlock

<https://github.com/gorhill/uBlock/wiki>

## Selectors

### Block by attribute

Use the form `div[attr="value"]`.

Using an example from **The Guardian**'s website, to block the element `<gu-island name="StickyBottomBanner">`:

```css
/* Block the banner at the bottom of The Guardian's articles */
gu-island[name="StickyBottomBanner"]
```
