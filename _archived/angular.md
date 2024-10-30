# Angular

## RouterModule

`RouterModule.forRoot(routes, {enableTracing: true} )`

- `enableTracing` → makes the router log all its internal events to the console.

## Templates

- To be able to reference an enum in a template, [you have to add a reference to the enum in the componen](https://stackoverflow.com/questions/45361006/using-enums-in-angular2-view-templates/45361066#45361066)
  - example:

```typescript
  import { sampleEnum } from './sampleEnum';

  export class SampleComponent { sampleEnum = sampleEnum; ... }
```

## RxJS

- `import { Observable } from 'rxjs/Observable';`
  - note that `Observable` must be capitalized or you'll get the error `TypeError: observable_1.Observable.of is not a function`

## v6 changes

- `import 'rxjs/add/operator/map'`=> `import { map } from "rxjs/operators";`
- `Observable.of(x)` => `of(x)`
- `Observable.subscribe().map(x => x + x)` => `Observable.subscribe().pipe(map(x => x + x))`

## Tests

- new test files won't be picked up unless you restart `ng test`
- Pending tests:

```typescript
xit("can be declared 'xit'", function () {
  expect(true).toBe(false);
}); // shows as pending spec

it("can be declared with 'it' but without a function");

it("can be declared by calling 'pending' in the spec body", function () {
  expect(true).toBe(false);

  pending();
});
```

## Selectors

- `fixture.debugElement.nativeElement.querySelector('div')` → return first match

- `fixture.debugElement.nativeElement.querySelectorAll('div')` → return all matches

## Http

- add `import {Response} from '@angular/http'` or you will get weird errors when the tests run because it resolves to the wrong `Response` type
  - (see <https://stackoverflow.com/a/45065503)>

## Test NOT Equal

- `expect(result).not.toEqual(x)`

## lodash

- import in the files using `lodash` (such as `app-config.service.ts`) have to be:
  - `import \- as \_ from 'lodash'`
  - NOT: `import \_ from 'lodash'`

## console messages

- `beforeEach(function(){ spyOn(console, 'error'); })`

```typescript
it('should print error to console', function () {
  yourApp.start();

  expect(console.error).toHaveBeenCalled();
});
```

- force a test failure
  - `fail(message: string)`

## Listening for keyboard input

- example:

```typescript
  // prevents keyboard input in the Adjustment Date field so user must use DatePicker
  @HostListener('body:keydown', ['$event'])

  keypress(event: any) {
      if (event.target.name === 'adjDate') {
          event.preventDefault();
      }
  }
```
