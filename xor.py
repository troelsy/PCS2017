def bruteforce(l):
    for n in ascii:
        for m in ascii:
                nn = ord(n)
                mm = ord(m)
                if nn ^ mm == target:
                    print l, "=", n,m
                    return


    for n in ascii:
        for m in ascii:
            for k in ascii+["\0"]:
                nn = ord(n)
                mm = ord(m)
                kk = ord(k)
                if nn ^ mm ^ kk == target:
                    print l, "=", n,m,k
                    return

ascii = list("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

for l in list([chr(0x7F)]):
    target = ord(l)
    bruteforce(l)
