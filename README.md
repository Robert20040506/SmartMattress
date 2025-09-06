This repo contains the code and data used in my smart mattress project.

The raw data is recorded from an 100Hz fiber-optic sensor connected to a layer of fiber-optics in the mattress. The ground truth is a set of heart and respiration rate pairs recorded on a per minute basis from an electrocardiogram. Timestamps are saved to match the raw data and the ground truth. The raw data isn't normalized because its mean and variance are close to 1.

DNNs, CNNs, and LSTMs were tested. DNNs have the highest accuracy of +-4bpm.

The code uses python 3.8 and tensorflow 2.

models.ipynb contains the tensorflow models, utils.py contains the data preprocessing code.

本仓库包含智能床垫项目所使用的代码与数据。

原始数据由嵌入床垫纤维层的 100Hz 光纤传感器采集；真实标注（ground truth）则来自心电图（ECG）逐分钟记录的 心率与呼吸率对。时间戳被保存，用于对齐原始数据与真实标注。由于原始数据的均值与方差接近 1，因此未进行归一化处理。

在模型实验中，测试了 DNN、CNN 与 LSTM，其中 DNN 达到最高精度，心率误差约为 ±4 bpm。

本项目基于 Python 3.8 与 TensorFlow 2 开发：
	•	models.ipynb：包含各类 TensorFlow 模型
	•	utils.py：实现数据预处理功能
