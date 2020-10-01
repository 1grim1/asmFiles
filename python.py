import random

min_numbers = 130
max_numbers = 165

a_numbers = random.randint(min_numbers, max_numbers)
b_numbers = random.randint(min_numbers, max_numbers)
c_numbers = max(a_numbers, b_numbers) + 1

a = [random.choice([i for i in range(256)]) for _ in range(a_numbers)]
b = [random.choice([i for i in range(256)]) for _ in range(b_numbers)]
c = [0 for _ in range(c_numbers)]

t = 0
for i in range(c_numbers):
	ia = a_numbers - i - 1
	ib = b_numbers - i - 1
	ic = c_numbers - i - 1
	c[ic] = t
	if ic <= 0:
		if t == 0:
			c.pop(0)
		break
	t = 0
	if ia >= 0:
		c[ic] += a[ia]
	if ib >= 0:
		c[ic] += b[ib]
	if c[ic] >= 256:
		c[ic] -= 256
		t = 1

f = open('FLOPPY_0', 'wb')
f.write(bytes(a))
f.close()

f = open('FLOPPY_1', 'wb')
f.write(bytes(b))
f.close()

f = open('FLOPPY_3', 'wb')
f.write(bytes(c))
f.close()

input()

f = open('FLOPPY_2', 'rb')
d = bytearray(f.read())
f.close()

print(bytes(d))
print(bytes(c)[:len(bytes(c)) - 1])

input()
