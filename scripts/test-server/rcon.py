"""Tiny RCON client for the local test server. Usage: python3 rcon.py "cmd 1" "cmd 2" """
import re
import socket
import struct
import sys


class R:
    def __init__(self, host="127.0.0.1", port=25575, password="test"):
        self.s = socket.create_connection((host, port), timeout=10)
        self.i = 0
        self._send(3, password)

    def _read(self, n):
        b = b""
        while len(b) < n:
            b += self.s.recv(n - len(b))
        return b

    def _send(self, kind, body):
        self.i += 1
        packet = struct.pack("<ii", self.i, kind) + body.encode() + b"\x00\x00"
        self.s.sendall(struct.pack("<i", len(packet)) + packet)
        n = struct.unpack("<i", self._read(4))[0]
        return self._read(n)[8:-2].decode(errors="replace")

    def c(self, cmd):
        return self._send(2, cmd)

    def val(self, cmd):
        """Returns just the value part of a `data get` / `scoreboard players get` reply."""
        out = self.c(cmd)
        m = re.search(r"data: (.*)$", out) or re.search(r" has (-?\d+) ", out)
        return m.group(1) if m else out


if __name__ == "__main__":
    r = R()
    for cmd in sys.argv[1:]:
        print(">", cmd)
        print(r.c(cmd))
