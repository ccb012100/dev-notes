# Playwright Test

Test Automation Framework

- [GitHub repo](https://github.com/microsoft/playwright)
- [docs](https://playwright.dev/docs/intro)

## Mocking APIs

```ts
await page.route('*/**/api/v1/foo', async route => {
  const json = [{ name: 'quux', id: 42 }];
  await route.fulfill({ json });
});
```

([source](https://playwright.dev/docs/mock))

## Patch/Modify HTTP Responses

```ts
await page.route('*/**/api/v1/foo', async route => {
  const response = await route.fetch();
  const responseJson = await response.json();

  responseJson.push({ name: 'quux', id: 42 });

  // Fulfill using the original response, while patching
  // the response body with the given JSON object.
  await route.fulfill({ response, responseJson });
});
```

([source](https://playwright.dev/docs/mock))

## Verify HTTP Request was not made

To verify that a certain API call was _not_ made, you can intercept all request events:

```ts
    let requestWasMade = false;
 
    page.on('request', request => {
      // requests to **/api/foo/bar/**
      if (request.url().match(/.+\/api\/foo/bar.*/)) {
          imagesRequested = true;
      }
    })

    await page.waitForLoadState("networkidle");
    expect(requestWasMade).toBe(false);
```

([source](https://stackoverflow.com/a/77554151/24445522))
