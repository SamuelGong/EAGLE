import sys
import json
from transformers import AutoTokenizer
import numpy as np

def main(args):
    # tokenizer=AutoTokenizer.from_pretrained("/home/lyh/weights/hf/llama2chat/13B/")
    # jsonl_file = "llama-2-chat-70b-fp16-ea-in-temperature-0.0.jsonl"
    # jsonl_file_base = "llama-2-chat-70b-fp16-base-in-temperature-0.0.jsonl"

    tokenizer = AutoTokenizer.from_pretrained(args[0])
    jsonl_file = args[1]
    jsonl_file_base = args[2]

    data = []
    with open(jsonl_file, 'r', encoding='utf-8') as file:
        for line in file:
            json_obj = json.loads(line)
            data.append(json_obj)



    speeds=[]
    for datapoint in data:
        qid=datapoint["question_id"]
        answer=datapoint["choices"][0]['turns']
        tokens=sum(datapoint["choices"][0]['new_tokens'])
        times = sum(datapoint["choices"][0]['wall_time'])
        speeds.append(tokens/times)


    data = []
    with open(jsonl_file_base, 'r', encoding='utf-8') as file:
        for line in file:
            json_obj = json.loads(line)
            data.append(json_obj)


    total_time=0
    total_token=0
    speeds0=[]
    for datapoint in data:
        qid=datapoint["question_id"]
        answer=datapoint["choices"][0]['turns']
        tokens = 0
        for i in answer:
            tokens += (len(tokenizer(i).input_ids) - 1)
        times = sum(datapoint["choices"][0]['wall_time'])
        speeds0.append(tokens / times)
        total_time+=times
        total_token+=tokens



    # print('speed',np.array(speeds).mean())
    # print('speed0',np.array(speeds0).mean())
    print("ratio",np.array(speeds).mean()/np.array(speeds0).mean())


if __name__ == "__main__":
    main(sys.argv[1:])
