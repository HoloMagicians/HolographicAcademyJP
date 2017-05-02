**Unity でのロケータブル カメラ**

**目次**

-   [*1 フォト ビデオ
    カメラの機能の有効化*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#enabling_the_capability_for_photo_video_camera)

-   [*2
    写真のキャプチャ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#photo_capture)

    -   [*2.1 PhotoCapture
        の共通セットアップ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#common_set_up_for_photocapture)

    -   [*2.2
        ファイルへの写真のキャプチャ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#capture_a_photo_to_a_file)

    -   [*2.3 Texture2D
        への写真のキャプチャ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#capture_a_photo_to_a_texture2d)

    -   [*2.4
        写真のキャプチャとキャプチャしたバイト列そのものの操作*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#capture_a_photo_and_interact_with_the_raw_bytes)

-   [*3
    ビデオのキャプチャ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#video_capture)

-   [*4
    トラブルシューティング*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#troubleshooting)

-   [*5
    関連項目*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera_in_unity#see_also)

**フォト ビデオ カメラの機能の有効化**

アプリで[*カメラ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera)を使用するには「Web
カメラ」機能を宣言する必要あります。

1.  Unity エディターで、\[Edit\] (編集)、\[Project Settings\]
    (プロジェクト設定)、\[Player\] (プレイヤー)
    の順に選び、プレイヤーの設定に移動します。

2.  \[Windows Store\] (Windows ストア) タブをクリックします。

3.  \[Publishing Settings\] (発行の設定) の \[Capabilities\] (機能)
    セクションで、\[WebCam\] (Web カメラ) 機能と \[Microphone\] (マイク)
    機能のチェック ボックスをオンにします。

カメラでは一度に 1 つの操作しか実行できません。カメラの現在モード
(フォト、ビデオ、なし) を判断するには、UnityEngine.VR.WSA.WebCam.Mode
をチェックします。

**写真のキャプチャ**

**名前空間:** UnityEngine.VR.WSA.WebCam

**型:** PhotoCapture

PhotoCapture 型により、フォト ビデオ
カメラを使用して静止画写真を撮影できるようになります。PhotoCapture
を使用して写真を撮影する一般的なパターンは以下のとおりです。

1.  PhotoCapture オブジェクトを作成します。

2.  必要な設定で CameraParameters を作成します。

3.  StartPhotoModeAsync を使用してフォト モードを開始します。

4.  目的の写真を撮影します。

    -   (オプション) その写真を操作します。

5.  フォト モードを停止し、リソースをクリーンアップします。

**PhotoCapture の共通セットアップ**

以下で説明する 3 つの用途はどれも、上記の最初の 3 つの手順から始めます。

まず、PhotoCapture オブジェクトを作成します。

PhotoCapture photoCaptureObject = null;

void Start()

{

PhotoCapture.CreateAsync(false, OnPhotoCaptureCreated);

}

次に、このオブジェクトを保存し、パラメーターを設定して、フォト
モードを開始します。

void OnPhotoCaptureCreated(PhotoCapture captureObject)

{

photoCaptureObject = captureObject;

Resolution cameraResolution =
PhotoCapture.SupportedResolutions.OrderByDescending((res) =&gt;
res.width \* res.height).First();

CameraParameters c = new CameraParameters();

c.hologramOpacity = 0.0f;

c.cameraResolutionWidth = cameraResolution.width;

c.cameraResolutionHeight = cameraResolution.height;

c.pixelFormat = CapturePixelFormat.BGRA32;

captureObject.StartPhotoModeAsync(c, false, OnPhotoModeStarted);

}

最後に、以下に示す同一のクリーンアップ コードも使用します。

void OnStoppedPhotoMode(PhotoCapture.PhotoCaptureResult result)

{

photoCaptureObject.Dispose();

photoCaptureObject = null;

}

これらの手順の後、キャプチャする写真の種類を選択できます。

**ファイルへの写真のキャプチャ**

最も単純なのは、写真を直接ファイルにキャプチャする操作です。写真は JPG
または PNG として保存できます。

フォト
モードが正常に開始されたら、写真を撮影するとその写真がディスクに保存されるようになります。

private void OnPhotoModeStarted(PhotoCapture.PhotoCaptureResult result)

{

if (result.success)

{

string filename = string.Format(@"CapturedImage{0}\_n.jpg", Time.time);

string filePath = System.IO.Path.Combine(Application.persistentDataPath,
filename);

photoCaptureObject.TakePhotoAsync(filePath,
PhotoCaptureFileOutputFormat.JPG, OnCapturedPhotoToDisk);

}

else

{

Debug.LogError("Unable to start photo mode!");

}

}

写真をディスクにキャプチャしたら、フォト
モードを終了し、オブジェクトをクリーンアップします。

void OnCapturedPhotoToDisk(PhotoCapture.PhotoCaptureResult result)

{

if (result.success)

{

Debug.Log("Saved Photo to disk!");

photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);

}

else

{

Debug.Log("Failed to save Photo to disk");

}

}

**Texture2D への写真のキャプチャ**

データを Texture2D
にキャプチャする手順は、ディスクにキャプチャするのとほぼ同じです。

セットアップは前述の手順に従います。

OnPhotoModeStarted で、フレームをメモリにキャプチャします。

private void OnPhotoModeStarted(PhotoCapture.PhotoCaptureResult result)

{

if (result.success)

{

photoCaptureObject.TakePhotoAsync(OnCapturedPhotoToMemory);

}

else

{

Debug.LogError("Unable to start photo mode!");

}

}

次に、結果をテクスチャに適用して、前述の共通クリーンアップ
コードを使用します。

void OnCapturedPhotoToMemory(PhotoCapture.PhotoCaptureResult result,
PhotoCaptureFrame photoCaptureFrame)

{

if (result.success)

{

// Create our Texture2D for use and set the correct resolution

Resolution cameraResolution =
PhotoCapture.SupportedResolutions.OrderByDescending((res) =&gt;
res.width \* res.height).First();

Texture2D targetTexture = new Texture2D(cameraResolution.width,
cameraResolution.height);

// Copy the raw image data into our target texture

photoCaptureFrame.UploadImageDataToTexture(targetTexture);

// Do as we wish with the texture such as apply it to a material, etc.

}

// Clean up

photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);

}

**写真のキャプチャとキャプチャしたバイト列そのものの操作**

メモリ内のフレームのバイト列をそのまま操作するには、前述と同じセットアップ手順に従い、写真を
Texture2D にキャプチャしたのと同じ OnPhotoModeStarted
を使用します。異なるのは OnCapturedPhotoToMemory
での処理です。ここでは、キャプチャしたバイト列そのものを取得して操作できます。

この例では List&lt;Color&gt; を作成します。List&lt;Color&gt;
では細かい処理や、SetPixels() を使ったテクスチャへの適用が可能です。

void OnCapturedPhotoToMemory(PhotoCapture.PhotoCaptureResult result,
PhotoCaptureFrame photoCaptureFrame)

{

if (result.success)

{

List&lt;byte&gt; imageBufferList = new List&lt;byte&gt;();

// Copy the raw IMFMediaBuffer data into our empty byte list.

photoCaptureFrame.CopyRawImageDataIntoBuffer(imageBufferList);

// In this example, we captured the image using the BGRA32 format.

// So our stride will be 4 since we have a byte for each rgba channel.

// The raw image data will also be flipped so we access our pixel data

// in the reverse order.

int stride = 4;

float denominator = 1.0f / 255.0f;

List&lt;Color&gt; colorArray = new List&lt;Color&gt;();

for (int i = imageBufferList.Count - 1; i &gt;= 0; i -= stride)

{

float a = (int)(imageBufferList\[i - 0\]) \* denominator;

float r = (int)(imageBufferList\[i - 1\]) \* denominator;

float g = (int)(imageBufferList\[i - 2\]) \* denominator;

float b = (int)(imageBufferList\[i - 3\]) \* denominator;

colorArray.Add(new Color(r, g, b, a));

}

// Now we could do something with the array such as texture.SetPixels()
or run image processing on the list

}

photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);

}

**ビデオのキャプチャ**

**名前空間:** UnityEngine.VR.WSA.WebCam

**型:** VideoCapture

VideoCapture 関数は PhotoCapture とほぼ同じです。異なるのは、1
秒あたりのフレーム数 (FPS) の値を指定することと、.mp4
ファイル形式以外ではディスクに直接保存できないことの 2
点のみです。VideoCapture は以下の手順で使用します。

1.  VideoCapture オブジェクトを作成します。

2.  必要な設定で CameraParameters を作成します。

3.  StartVideoModeAsync を使用してビデオ モードを開始します。

4.  ビデオの録画を開始します。

5.  ビデオの録画を停止します。

6.  ビデオ モードを停止し、リソースをクリーンアップします。

まず、VideoCapture オブジェクトを作成します。

VideoCapture m\_VideoCapture = null;

void Start ()

{

VideoCapture.CreateAsync(false, OnVideoCaptureCreated);

}

次に、録画と開始に必要なパラメーターを設定します。

void OnVideoCaptureCreated (VideoCapture videoCapture)

{

if (videoCapture != null)

{

m\_VideoCapture = videoCapture;

Resolution cameraResolution =
VideoCapture.SupportedResolutions.OrderByDescending((res) =&gt;
res.width \* res.height).First();

float cameraFramerate =
VideoCapture.GetSupportedFrameRatesForResolution(cameraResolution).OrderByDescending((fps)
=&gt; fps).First();

CameraParameters cameraParameters = new CameraParameters();

cameraParameters.hologramOpacity = 0.0f;

cameraParameters.frameRate = cameraFramerate;

cameraParameters.cameraResolutionWidth = cameraResolution.width;

cameraParameters.cameraResolutionHeight = cameraResolution.height;

cameraParameters.pixelFormat = CapturePixelFormat.BGRA32;

m\_VideoCapture.StartVideoModeAsync(cameraParameters,

VideoCapture.AudioState.None,

OnStartedVideoCaptureMode);

}

else

{

Debug.LogError("Failed to create VideoCapture Instance!");

}

}

ビデオ モードが開始されたら、録画を始めます。

void OnStartedVideoCaptureMode(VideoCapture.VideoCaptureResult result)

{

if (result.success)

{

string filename = string.Format("MyVideo\_{0}.mp4", Time.time);

string filepath = System.IO.Path.Combine(Application.persistentDataPath,
filename);

m\_VideoCapture.StartRecordingAsync(filepath, OnStartedRecordingVideo);

}

}

録画開始後に、UI
または動作を更新して、録画を停止できるようにします。ここではログに記録するだけです。

void OnStartedRecordingVideo(VideoCapture.VideoCaptureResult result)

{

Debug.Log("Started Recording Video!");

// We will stop the video from recording via other input such as a timer
or a tap, etc.

}

この後、録画を停止することになります。たとえば、タイマーを使ったり、ユーザーの入力を利用して停止します。

// The user has indicated to stop recording

void StopRecordingVideo()

{

m\_VideoCapture.StopRecordingAsync(OnStoppedRecordingVideo);

}

録画が停止したら、ビデオ
モードを停止し、リソースをクリーンアップします。

void OnStoppedRecordingVideo(VideoCapture.VideoCaptureResult result)

{

Debug.Log("Stopped Recording Video!");

m\_VideoCapture.StopVideoModeAsync(OnStoppedVideoCaptureMode);

}

void OnStoppedVideoCaptureMode(VideoCapture.VideoCaptureResult result)

{

m\_VideoCapture.Dispose();

m\_VideoCapture = null;

}

**トラブルシューティング**

-   利用できる解像度がない場合

    -   Web カメラ機能をプロジェクトで指定していることを確認します。

**関連項目**

-   [*ロケータブル
    カメラ*](https://developer.microsoft.com/ja-jp/windows/holographic/locatable_camera)


