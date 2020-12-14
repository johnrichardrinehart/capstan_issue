# capstan_issue
A repository including a reproduceable issue with capstan

Just run `./build_and_run.sh` from the root of the repository and you should see the image run fail with something like:

```
➜  capstan-project git:(master) ✗ ./capstan run -v demo       
Removing orphaned instance folder: /home/john/.capstan/instances/qemu/demo
Command line will be set to default boot
Created instance: demo
Setting cmdline: runscript /run/default;
Invoking QEMU at: /usr/bin/qemu-system-x86_64 with arguments:
  -vnc :1
  -m 1024
  -smp 2
  -device virtio-blk-pci,id=blk0,bootindex=0,drive=hd0
  -drive file=/home/john/.capstan/instances/qemu/demo/disk.qcow2,if=none,id=hd0,aio=threads,cache=none
  -chardev stdio,mux=on,id=stdio,signal=off
  -device isa-serial,chardev=stdio
  -netdev user,id=un0,net=192.168.122.0/24,host=192.168.122.1
  -device virtio-net-pci,netdev=un0
  -chardev socket,id=charmonitor,path=/home/john/.capstan/instances/qemu/demo/osv.monitor,server,nowait
  -mon chardev=charmonitor,id=monitor,mode=control
OSv v0.55.0-2-gdbfb0bb1
eth0: 192.168.122.15
Booted up in 0.00 ms
Cmdline: runscript /run/default;
Failed to open runscript file '/run/default'.
Failed to parse command line.
```

It appears that the `run` command isn't executing the proper runscript....
