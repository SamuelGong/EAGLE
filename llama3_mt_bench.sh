#!/bin/bash
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=1 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=2 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=3 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=4 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=6 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=7 --top-k=10 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=8 --top-k=10 --total-token=60 &
wait
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=4 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=6 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=8 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=12 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=14 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=16 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=18 --total-token=60 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=10 &
wait
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=20 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=30 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=40 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=50 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=70 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=80 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=90 &
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=110 &
wait
python -m eagle.evaluation.gen_ea_answer_llama3chat --ea-model-path=yuhuili/EAGLE-LLaMA3-Instruct-8B --base-model-path=meta-llama/Meta-Llama-3-8B-Instruct --depth=5 --top-k=10 --total-token=120 &
wait