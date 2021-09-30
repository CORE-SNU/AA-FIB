AA-FIB
====================================================

This repository includes an official python implementation of **AA-FIB**, compatible with POMDP problems of .pomdp file format from [POMDP.org][POMDP.org], [APPL][APPL]

## 1. Requirements


Followings must be installed to run our implementation

- **Python (>=3.7)**


Our code is tested on Ubuntu 18.04, with Python 3.7.4


## 2. Quick Start
First, clone our repository with:
```
$ git clone https://github.com/POMDP-core/AA-FIB.git && cd AA-FIB && mkdir solver solver0
```
Try solving simple example problem by:
```
$ python solve_AA_FIB.py FIB mit 10 1e-6 1e-16; python evaluate_AA_FIB.py FIB mit 100 1e-16
```
You can check output in `result.txt`, `result_eval.txt`


## 3. Solve/Evaluate
### 3.1 FIB
Run vanilla FIB pomdp solver with following commands:
```
$ python solve_FIB.py FIB POMDP_file repeat_number precision (sample_number)
$ python evaluate_FIB.py FIB POMDP_file number_runs
```
Total 3 ~ 4 arguments with argument 'FIB' should be given. Each are experimental parameters
- POMDP_file : select the POMDP to be solved (among the files under examples/env)
- repeat_number : number of initializations
- precision : precision to stop the algorithm
- sample_number : run simulated version of FIB update with sample number (optional)

FIB solution will be saved in `./solver` directory

### 3.2 AA-FIB
Run AA-FIB pomdp solver with following commands
```
$ python solve_AA_FIB.py FIB POMDP_file repeat_number precision lambda (sample_number)
$ python evaluate_AA_FIB.py FIB POMDP_file number_runs lambda
```
Total 5 ~ 6 arguments with argument 'FIB' should be given. Each are experimental parameters
- POMDP_file : select the POMDP to be solved (among the files under examples/env)
- repeat_number : number of initializations
- lambda: regularization parameter eta in paper
- number_runs : number of runs for the evaluation
- precision : precision to stop the algorithm
- sample_number : run simulated version of AA-FIB update with sample number (optional)

AA-FIB solution will be saved in `./solver` directory

We provide our results with FIB under `./solver_exact`, for reporduction baseline.


## 4. Work with other environments
For custom environments, download .pomdp file from [POMDP.org][POMDP.org], [APPL][APPL] to `./examples/env`.

.pomdp file sholud be parsed into .pickle files to be compatible with our code. This can be done by:
```
$ python convert_pomdp.py POMDP_file
```

To run simulated version of AA-FIB with custon environments, you should get solution of exact version first, and copy them to `./solver_exact` directory.

[POMDP.org]: http://pomdp.org/examples/
[APPL]: https://bigbird.comp.nus.edu.sg/pmwiki/farm/appl/index.php?n=Main.Repository
