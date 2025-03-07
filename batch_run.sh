#!/bin/bash
python -m eagle.evaluation.gen_ea_answer_vicuna --ea-model-path=yuhuili/EAGLE-Vicuna-7B-v1.3 --base-model-path=lmsys/vicuna-7b-v1.3 --depth=1 --top-k=10 --total-token=60
python -m eagle.evaluation.gen_ea_answer_vicuna --ea-model-path=yuhuili/EAGLE-Vicuna-7B-v1.3 --base-model-path=lmsys/vicuna-7b-v1.3 --depth=2 --top-k=10 --total-token=60
python -m eagle.evaluation.gen_ea_answer_vicuna --ea-model-path=yuhuili/EAGLE-Vicuna-7B-v1.3 --base-model-path=lmsys/vicuna-7b-v1.3 --depth=3 --top-k=10 --total-token=60
python -m eagle.evaluation.gen_ea_answer_vicuna --ea-model-path=yuhuili/EAGLE-Vicuna-7B-v1.3 --base-model-path=lmsys/vicuna-7b-v1.3 --depth=4 --top-k=10 --total-token=60
python -m eagle.evaluation.gen_ea_answer_vicuna --ea-model-path=yuhuili/EAGLE-Vicuna-7B-v1.3 --base-model-path=lmsys/vicuna-7b-v1.3 --depth=5 --top-k=10 --total-token=60