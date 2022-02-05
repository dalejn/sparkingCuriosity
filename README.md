# Sparking Curiosity
Animate movement in word-vector similarity space

<img src="img/repo_pic1.gif" width="250"/> <img src="img/repo_pic2.gif" width="250"/> 

Visualizations of cognitive and language graph methods from:
 * Lydon-Staley, D. M., Zhou, D., Blevins, A. S., Zurn, P., & Bassett, D. S. (2021). Hunters, busybodies and the knowledge network building associated with deprivation curiosity. *Nature Human Behaviour*, 5(3), 327-336. [https://doi.org/10.1038/s41562-020-00985-7](https://doi.org/10.1038/s41562-020-00985-7)

 * Zhou, D., Lydon-Staley, D. M., Zurn, P., & Bassett, D. S. (2020). The growth and form of knowledge networks by kinesthetic curiosity. *Current Opinion in Behavioral Sciences*, 35, 125-134. [https://doi.org/10.1016/j.cobeha.2020.09.007](https://doi.org/10.1016/j.cobeha.2020.09.007)

## Instructions

1. Launch the coding environment 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dalejn/sparkingCuriosity/HEAD?urlpath=/tree/)

2. Go to the `/data` folder and upload a .txt file containing the sequence of words that you want to animate dynamics atop a network made from those words.
![data GUI](img/dataGUI.png)
---
![upload GUI](img/uploadGUI.png)
---
![confirm GUI](img/confirmUploadGUI.png)

3. Go back to the first directory level, open, and run the notebook `cleanText.ipynb`
![back GUI](img/backToMainGUI.png)

4. Go back to the first directory level and shutdown `cleanText.ipynb` after it finishes running (saves memory since notebooks will crash after 2 GB)
![shutdown GUI](img/clickToShutdownGUI.png)

5. Open and run the code sections in `animate.ipynb`. You can change the number of frames (`break`), the speed (`interval`), and the image size and resolution (`ani.width`, `ani.height`, `res`).

6. Go back to the first directory level and save your animated network dynamics in .gif form. If you would like to visualize the static network using Gephi or other software, we also provide the network saved to `network.graphml` for download.
![download GUI](img/downloadGUI.png)

## Gallery

<img src="img/gallery/sparkingCuriosityTandy.gif" width="250"/> <img src="img/gallery/sparkingCuriosityZhang.gif" width="250"/> 