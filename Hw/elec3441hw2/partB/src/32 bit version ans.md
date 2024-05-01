# ELEC3441 Hw2_gp- 32 Bit version
**Bao Xinyang 3035952989**
</br> **Jiang Feiyu 3035770800**

This is the riscV-32 version, which all the program is run by modifying makefile: `CC = riscv32-unknown-elf-gcc`
And then `make clean`, `make`

`spike --ic=128:1:32 --dc=256:1:32 --l2=1024:2:128 pk {folder}`

<div STYLE="page-break-after: always;"></div>

## B1.4

Tabels generated with `./src/auto.py`, the raw data can refer to `./src/result.csv` and `./src/result_32.xlsx`.
   

1. `kmean` has the best performance with `L1 I$`, `fir` has the best performance with `L1 D$`, `mm` has the best performance with `L2$`, but the worst performance with `L1 D$`. `quicksort` has the worst performance with `L1 I$`, `bfs` matrix has the worst performance with `L2$`.
   
    <img src="https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/381265c64d244625a3f5247ae3bbd2ee~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=266&h=152&s=17580&e=png&b=f9f9f9" alt="螢幕截圖 2024-04-09 上午11.04.20.png" width="70%" />
2. 
    `L1 I$` has a line size of $32 bytes / 4 = 8 words$, and capasity of $128\times1\times32=4KiB$. The cache access time is 240ps.

    `L1 D$` has a line size $32 bytes / 4 = 8 words$, and capasity of $256\times1\times32=8KiB$. The cache access time is 280ps.

    `L2$` has a line size of $128 bytes / 4 = 32 words$, this configuration is not included in table `B.1`.
    
    <p align=center><img src="https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e928638f84ca42f99366b0fd9a9e7155~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=759&h=216&s=49784&e=png&b=fcfcfc" alt="螢幕截圖 2024-04-07 上午10.48.03.png" width="70%" /></p>

3. For the processor without `L2`, the cache access time is less than 600ps, so the cycle time is 600ps. For the processor with `L2`, the cache access time of `L2` is more than 600ps, so the cycle time is the cache access time of `L2`.

<div STYLE="page-break-after: always;"></div>

4. For MP, we assume it's $100+7\times5=135$, as there are 8 words in one line; For CT, we assume it's 600ps, discussed in B.1.4.3. The general formula is:
    
    $CPI = 1.2+\frac{D\ read\ miss+D\ write\ miss +I\ read\ miss}{I\ read\ accesses\ No.}\times\frac{135}{0.6}$
    
    <img src="https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/41b03c142fe94a0e87ffd0074a6254d1~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=782&h=153&s=39226&e=png&b=f7f7f7" alt="螢幕截圖 2024-04-09 上午11.15.09.png" width="90%" />
    
    | Benchmark | CPI |
    | --- | --- |
    | mm |5.39081289|
    | bfs_matrix |6.981074488|
    | quicksort |8.348844421|
    | fir |1.28963943|
    | sobel |1.507450306|
    | kmean |1.284466927|
    | conv2D |2.21943036|
    | bfs_pointer |6.901615014|

    The average CPI is 4.24041673.

5. According to the formula, $AMAT_{L2} = HT_{L2} + MR_{L2} × MP_{L2}$, we assume the $MP_{L12}=100+7*15=205, HT_{L2}=10$, thus:

    <p align=center><img src="https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/664c1d2e52724ef096a1ef7c3bc986ce~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=323&h=153&s=17968&e=png&b=f9f9f9" alt="螢幕截圖 2024-04-09 上午11.33.18.png" width="70%" /></p>

<div STYLE="page-break-after: always;"></div>

6. Calculate the average CPI for the benchmarks with L2 cache：
    
    $CPI = 1.2+\frac{D\ read\ miss+D\ write\ miss +I\ read\ miss}{I\ read\ accesses\ No.}\times\frac{AMAT_{L2}}{0.6}$
    
    Since there is no Cache access time table for L2, we assume the CT still equals to 600ps.
    
    <p align=center><img src="https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6a83efcac8914267a0235ab34b901d53~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=781&h=152&s=39503&e=png&b=f8f8f8" alt="螢幕截圖 2024-04-09 下午11.41.34.png" width="100%" /></p>

   | Benchmark | CPI |
   | --- | --- |
   | mm |1.528376576|
   | bfs_matrix |2.969871672|
   | quicksort |1.827679131|
   | fir |1.218811731|
   | sobel |1.238698998|
   | kmean |1.208153843|
   | conv2D |1.347759635|
   | bfs_pointer |2.209527954|

   The average CPI is 1.693609943.
   
7. `L2$` contributes positively to system performance by improving cache hit rate, reducing miss penalty, and increasing data and instruction availability. Therefore, it can be said that `L2$` helps enhance performance.

<div STYLE="page-break-after: always;"></div>

## B1.5
Full code avaliable at `./src/5.sh` and `./src/analysis.ipynb`, full data avaliable at `./src/dc.csv` and `./src_32/ranking.xlsx`.

<img src="https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/4081318d0556406d8adbdfbfb84fb826~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=148&h=93&s=11006&e=png&b=f6f6f6" alt="螢幕截圖 2024-04-09 下午8.22.38.png" width="30%" />

The top configurations is:

| Cache Configuration | Mean Miss Rate |
| --- | --- |
| 32768:2:32 |0.537679192%|

which is one of the is the optimal cache configuration for the giving benchmarks.