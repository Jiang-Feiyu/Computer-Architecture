# ELEC3441 lab4
**JIANG Feiyu 3035770800**

### 5.3 Checkoff 1
(1)
```
add     a1, a0, a0
slli    a2, a1, 8
```
```
sub     a3, a2, a1
slli    a2, a1, 8
```

(2) The subsequent instructions are stalled, and bubbles are pushed into pipeline.

(3) `0x00001e0f`

(4) 2, different with the default processor

### 6.3 Checkoff 2
- Staled data is used
- `0x0000000f`
- 1.5, which is the same with default
- The 5-stage processor and the 5-stage processor w/o forwarding or hazard detection results in the highest . The 5-stage processor and the 5-stage processor w/o forwarding results in the correct answer.

### 7.4 Checkoff 3
(1) verify
(2) The default 5-stage processor with forwarding runs at CPI = 1.65, the 5-stage processor without forwarding runs at CPI = 1.85, so the default 5-stage processor with forwarding has a higher performance.