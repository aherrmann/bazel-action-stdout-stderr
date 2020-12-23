Expected output on clean build - includes messages to stdout/stderr:
```
$ bazel build //:custom
INFO: Invocation ID: f391dbf2-3e09-4124-b92b-d86ff30cec1f
INFO: Analyzed target //:custom (4 packages loaded, 6 targets configured).
INFO: Found 1 target...
INFO: From Action custom.run:
run on stderr
run on stdout
INFO: From Action custom.run_shell:
run_shell on stderr
run_shell on stdout
Target //:custom up-to-date:
  bazel-bin/custom.run
  bazel-bin/custom.run_shell
INFO: Elapsed time: 1.297s, Critical Path: 0.14s
INFO: 3 processes: 2 remote cache hit, 1 internal.
INFO: Build completed successfully, 3 total actions
```

Expected output on second build - no more messages to stdout/stderr:
```
$ bazel build //:custom
INFO: Invocation ID: 4269d4a2-b857-4f71-a101-018dc489bc13
INFO: Analyzed target //:custom (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //:custom up-to-date:
  bazel-bin/custom.run
  bazel-bin/custom.run_shell
INFO: Elapsed time: 0.113s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```
