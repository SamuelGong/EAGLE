#!/bin/bash
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=1 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=2 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=3 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=4 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=6 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=7 --top-k=10 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=8 --top-k=10 --total-token=60 --bench-name=humaneval &
wait
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=4 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=6 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=8 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=12 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=14 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=16 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=18 --total-token=60 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=10 --bench-name=humaneval &
wait
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=20 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=30 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=40 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=50 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=70 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=80 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=90 --bench-name=humaneval &
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=110 --bench-name=humaneval &
wait
python -m eagle.evaluation.gen_ea_answer_qwen2 --ea-model-path=yuhuili/EAGLE-Qwen2-7B-Instruct --base-model-path=Qwen/Qwen2-7B-Instruct --depth=5 --top-k=10 --total-token=120 --bench-name=humaneval &