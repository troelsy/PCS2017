def bruteforce(target):
    l = ord(target)
    for n in ascii:
        for m in ascii:
                nn = ord(n)
                mm = ord(m)
                if nn ^ mm == l:
                    print target, "(%d/0x%x)" % (l,l), "=", n,m
                    return

ascii = list("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

for l in range(0x80):
    bruteforce(chr(l))
