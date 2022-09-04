# Hello World

Welcome to Hello World on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

The classical introductory exercise. Just say "Hello, World!".

["Hello, World!"](http://en.wikipedia.org/wiki/%22Hello,_world!%22_program) is
the traditional first program for beginning programming in a new language
or environment.

The objectives are simple:

- Modify the provided code so that it produces the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

## Source

### Created by

- @robkeim

### Contributed to by

- @ErikSchierboom
- @j2jensen

### Based on

This is an exercise to introduce users to using Exercism - http://en.wikipedia.org/wiki/%22Hello,_world!%22_program

## Setup notes

NuGet was configured with an empty `nuget.config` in `$HOME\AppData\Roaming\NuGet\nuget.config` which led to `NU1100` errors when running `dotnet test` since the project dependency software could not be auto-downloaded.

Fixed via:

`dotnet nuget add source --name "NuGet official package source manually added" "https://api.nuget.org/v3/index.json"`

References:

- [NuGet package consumption overview](https://docs.microsoft.com/en-us/nuget/consume-packages/overview-and-workflow)
- [nuget.org missing from package sources on fresh install](https://developercommunity.visualstudio.com/t/nugetorg-missing-from-package-sources-on-fresh-ins/1374946)
- [NuGet settings defaults](https://docs.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior#settings-walkthrough)
