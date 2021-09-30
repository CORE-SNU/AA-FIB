'''
vanilla FIB pomdp solver

python solve_FIB.py FIB POMDP_file repeat_number precision (sample_number)
python evaluate_FIB.py FIB POMDP_file number_runs

-> POMDP_file : select the POMDP to be solved (among the files under examples/env)
-> repeat_number : number of initializations
-> precision : precision to stop the algorithm
-> sample_number : run simulated version of FIB update with sample number

AA-FIB pomdp solver

python solve_AA_FIB.py FIB POMDP_file repeat_number precision lambda (sample_number)
python evaluate_AA_FIB.py FIB POMDP_file number_runs lambda

-> POMDP_file : select the POMDP to be solved (among the files under examples/env)
-> repeat_number : number of initializations
-> lambda: regularization parameter eta in paper
-> number_runs : number of runs for the evaluation
-> precision : precision to stop the algorithm
-> sample_number : run simulated version of AA-FIB update with sample number
'''

for env in "mit" "TagAvoid" "under_water"; do
    for lamb in 1e-16 1e-24 1e-32; do
        python solve_AA_FIB.py FIB ${env} 100 1e-6 ${lamb} 10
        python evaluate_AA_FIB.py FIB ${env} 100 ${lamb}
    done
done
