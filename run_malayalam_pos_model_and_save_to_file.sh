# Run Malayalam POS tagger and save the output to a file.
input_file=$1
output_file=$2
model_path=$3
feature_path=$input_file"-features-for-pos"
python3 create_features_for_pos_tagging.py --input $input_file --output $feature_path
pred_path=$input_file"-features-with-predicted-pos"
crf_test -m $model_path $feature_path > $pred_path
cut -f1,14 $pred_path > $output_file
rm -rf $feature_path $pred_path
