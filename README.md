# AVT-VIBE -- Video bitrate estimation model

This is the repository of two video bitrate estimation models, which have been developed for the [ICIP 2024 GRAND CHALLENGE
ON VIDEO COMPLEXITY](https://cd-athena.github.io/GCVC/index.html)

## Models
In `models` you can find two bash scripts:

* est_sf_crf.sh
* est_uf_qp_sr_crf.sh

Both models require [FFMPEG](https://ffmpeg.org/) to be installed and [BC](https://www.gnu.org/software/bc/).

## Usage
You need to call the model with a video as first argument, e.g. `./est_uf_qp_sr_crf.sh <video>`, which should result in an output similar to:

```
{"video": <video>", "estimated_bitrate_[kb/s]": 7472.53461021 }
```

## Acknowledgments
If you use this software in your research, please include a link to the repository and reference the following paper.

```bibtex
@article{goeringrao2024videocomplexity,
  title={AVT-VIBE -- OVERVIEW OF TWO MODELS FOR THE ICIP 2024 GRAND CHALLENGE ON VIDEO COMPLEXITY},
  author={Steve G\"oring and Rakesh Rao Ramachandra Rao},
}
```
