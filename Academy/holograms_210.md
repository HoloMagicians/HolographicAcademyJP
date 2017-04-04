# ホログラム 210 

[*視線*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/gaze)は最初の入力形式で、ユーザーの意図や認知を明らかにします。ホログラム 210 （別名、プロジェクト エクスプローラー) は、Windows Holographic の視線関連の考え方に深く関わっています。ここでは、これまでのカーソルとホログラムに状況認知を加え、ユーザーの視線をアプリが認識し、これを利用するようにします。

ここでは気さくな宇宙飛行士を使って視線の考え方を学びます。[ホログラム 101](holograms_101.md) では、視線に追従するだけのシンプルなカーソルを導入しました。今度は、このカーソルを以下のように少し高度にします。

-   カーソルとホログラムに視線を認識させます。つまり、ユーザーが見ている場所と見ていない場所に応じてカーソルとホログラムを両方変化させます。これにより、カーソルとホログラムに状況を認知させます。
-   カーソルとホログラムにフィードバックを追加し、ターゲットについての多くの状況をユーザーに提供します。このようなフィードバックには、オーディオやビジュアル効果を使用できます。
-   ユーザーが小さなターゲットをヒットできるように、ターゲット指定のテクニックを紹介します。
-   方向インジケーターを使って、ユーザーの注意をホログラムに引き付ける方法を紹介します。
-   仮想の世界をユーザーが動き回る動作にホログラムを追従させるテクニックを紹介します。

## 前提条件

-   適切な[*ツールをインストールして*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)構成した Windows 10 PC。
-   ある程度基本的な C\# プログラミング能力。
-   [*ホログラム 101*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/holograms_101) の修了。
-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#enabling_developer_mode) HoloLens デバイス。

## プロジェクト ファイル

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-210-Gaze.zip)はダウンロードします。Unity 5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-210.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

## 正誤表と注意事項

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\] の順に選び、\[マイ コードのみ\] を無効にする (チェック ボックスをオフにする) 必要があります。

## チュートリアルの内容

-   [第 1 章 - Unity のセットアップ](holograms_210.md#第-1-章---unity-のセットアップ)
    -   [1.1 HoloLens 用の Unity の設定](holograms_210.md#hololens-用の-unity-の設定)
    -   [1.2 アート アセットのインポート](holograms_210.md#アート-アセットのインポート)
    -   [1.3 シーンのセットアップ](holograms_210.md#シーンのセットアップ)
    -   [1.4 プロジェクトのビルド](holograms_210.md#プロジェクトのビルド)
-   [第 2 章 - カーソルとターゲット フィードバック](holograms_210.md#第-2-章---カーソルとターゲットのフィードバック)
-   [第 3 章 - ターゲット指定のテクニック](holograms_210.md#第-3-章---ターゲット指定のテクニック)
-   [第 4 章 - 方向インジケーター](holograms_210.md#第-4-章---方向インジケーター)
-   [第 5 章 - ビルボーディング](holograms_210.md#第-5-章---ビルボーディング)
-   [第 6 章 - 追従](holograms_210.md#第-6-章---追従)

## 第 1 章 - Unity のセットアップ

### 目標

-   HoloLens 開発用に Unity を最適化する。
-   アセットをインポートしてシーンをセットアップする。
-   HoloLens に宇宙飛行士を表示する。

### 手順

-   Unity を起動します。
-   \[New Project\] を選びます。
-   プロジェクトに「ModelExplorer」という名前を付けます。
-   最初にファイルを解凍した Gaze フォルダーの場所を入力します。
-   プロジェクトが \[3D\] に設定されていることを確認します。
-   \[Create Project\] をクリックします。

### HoloLens 用の Unity の設定

ここで、エクスポートするアプリが 2D ビューではなくホログラフィック ビューを作成することを Unity に認識させる必要があります。そのためには、HoloLens を仮想現実デバイスとして追加します。

-   \[Edit\] 、\[Project Settings\] 、\[Player\] に移動します。
-   \[Inspector\] パネルで、\[Player Settings\] に対して Windows ストア アイコンを選びます。
-   \[Other Settings\] グループを展開します。
-   \[Rendering\] セクションで、\[Virtual Reality Supported\] チェック ボックスをオンにして、新しい仮想現実 SDK の一覧を追加します。
-   Windows Holographic が一覧に表示されることを確認します。表示されない場合は、一覧下部にある \[+\] を選んで、\[Windows Holographic\] を選びます。
-   \[Edit\] 、\[Project Settings\] 、\[Quality\] の順に移動します。
-   \[Windows Store\] アイコン下の \[Default\] 列で、下矢印をクリックします。
-   \[Windows Store Apps\] に対して \[Fastest\] を選びます。

### アート アセットのインポート

-   \[Project\] パネルで Assets フォルダーを右クリックします。
-   \[Import Package\] 、\[Custom Package\] の順にクリックします。
-   ダウンロードしたプロジェクト ファイルに移動して、ModelExplorer.unitypackage をクリックします。
-   \[Open\] をクリックします。
-   パッケージが読み込まれたら、\[Import\] をクリックします。

### シーンのセットアップ

-   \[Hierarchy\] パネルで \[Main Camera\] を削除します。
-   HoloToolkit フォルダー、Utilities フォルダー、Prefabs フォルダーの順に開きます。
-   Prefabs フォルダーから \[Main Camera\] をドラッグして、\[Hierarchy\] パネルにドロップします。
-   \[Hierarchy\] パネルで Directional Light オブジェクトを右クリックして、\[Delete\] を選びます。
-   Holograms フォルダーで、以下のアセットをドラッグして \[Hierarchy\] パネルのルートにドロップします。
    -   **AstroMan**
    -   **Lights**
    -   **SpaceAudioSource**
    -   **SpaceBackground**
-   \[Play Mode\] を開始して、宇宙飛行士を表示します。
-   \[Play Mode\] を再度クリックすると、停止します。
-   Holograms フォルダーの Fitbox アセットをドラッグして、\[Hierarchy\] パネルのルートにドロップします。
-   \[Hierarchy\] パネルで Fitbox を選びます。
-   \[Inspector\] パネルの Fitbox の \[Hologram Collection\] プロパティまで、AstroMan コレクションをドラッグします。

### プロジェクトのビルド

-   \[File\] 、\[Save Scene As\] の順に選び、新しいシーンを保存します。
-   \[New Folder\] をクリックし、フォルダーに「Scenes」という名前を付けます。
-   ファイルに「ModelExplorer」という名前を付け、Scenes フォルダーに保存します。
-   Unity で、\[File\] 、\[Build Settings\] の順に選びます。
-   \[Add Open Scenes\] をクリックして、シーンを追加します。
-   \[Platform\] の一覧で \[Windows Store\] を選び、\[Switch Platform\] をクリックします。
-   \[SDK\] を \[Universal 10\] に、\[Build Type\] を \[D3D\] に設定します。
-   \[Unity C\# Projects\] チェック ボックスをオンにします。
-   \[Build\] をクリックします。
-   \[New Folder\] をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] をクリックします。
-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。
-   App フォルダーを開きます。
-   Visual Studio ソリューション「ModelExplorer」を開きます。
-   Visual Studio で、ソリューション エクスプローラーの \[Package.appxmanifest\] を右クリックし、\[コードの表示\] を選びます。
-   TargetDeviceFamily を指定している行を探し、Name="Windows.Universal" を Name="Windows.Holographic" に変更します。
-   Package.appxmanifest を保存します。
-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から \[Release\]、\[ARM\] から \[X86\] に変更します。
-   \[デバイス\] ボタンの横にある矢印をクリックして、\[リモート コンピューター\] を選びます。
-   デバイスの IP アドレスを入力し、\[認証モード\] を \[ユニバーサル (暗号化されていないプロトコル)\] に設定します。\[選択\] をクリックします。デバイスの IP アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\] の順に選んで、確認します。
-   上部のメニュー バーで \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。デバイスに初めて配置する場合は、[*Visual Studio とのペアリング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#pairing_your_device)が必要です。
-   アプリを配置したら、「選ぶ」ジェスチャーを使って Fitbox を消します。

## 第 2 章 - カーソルとターゲットのフィードバック

### 目標

-   カーソルのビジュアル デザインと動作
-   視線に応じたカーソルのフィードバック
-   視線に応じたホログラムのフィードバック

ここでは、以下に示すカーソルのデザイン原則を基に作業します。

1.  カーソルは常時表示します。
2.  カーソルは適切なサイズに保ちます。
3.  コンテンツの邪魔にならないようにします。

### 手順

-   \[Hierarchy\] パネル上部の \[Create\] メニューをクリックします。
-   \[Create Empty\] を選びます。
-   新しい GameObject を右クリックして、名前を「Managers」に変更します。
-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Gaze Manager」と入力します。検索結果を選びます。
-   \[Inspector\] パネルの \[RaycastLayerMask\] ボックスの一覧で \[TransparentFX\] の選択を解除します。
-   HoloToolkit フォルダー、Input フォルダー、Prefabs フォルダーの順に移動し Cursor アセットを探します。
-   Cursor アセットをドラッグして、\[Hierarchy\] パネルにドロップします。
-   \[Hierarchy\] パネルで Cursor オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Cursor Manager」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルで Cursor オブジェクトを展開します。
-   CursorOnHolograms オブジェクトをドラッグして、\[Inspector\] パネルの \[Cursor On Holograms\] プロパティにドロップします。
-   CursorOffHolograms オブジェクトをドラッグして、\[Inspector\] パネルの \[Cursor Off Holograms\] プロパティにドロップします。

この時点で、GazeManager.cs
ファイルを編集して、以下のタスクを実行するように変更します。

1.  物理レイキャストを実行します。
2.  レイキャストが交差する位置と法線を保存します。
3.  レイキャストがヒットしなかった場合、位置と法線に既定値を設定します。

GazeManager.cs で "Coding Exercise" というコメントを探し、自身でコードを記述してもかまいません。コメントはそれぞれ 1 行のコードに対応します。以下の完成版を使用してもかまいません。

GazeManager.cs
```cs
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// GazeManager determines the location of the user&#39;s gaze, hit position and normals.
    /// </summary>
    public class GazeManager : Singleton<GazeManager>
    {
        [Tooltip(&quot;Maximum gaze distance for calculating a hit.&quot;)]
        public float MaxGazeDistance = 5.0f;

        [Tooltip(&quot;Select the layers raycast should target.&quot;)]
        public LayerMask RaycastLayerMask = Physics.DefaultRaycastLayers;

        /// <summary>
        /// Physics.Raycast result is true if it hits a Hologram.
        /// </summary>
        public bool Hit { get; private set; }

        /// <summary>
        /// HitInfo property gives access
        /// to RaycastHit public members.
        /// </summary>
        public RaycastHit HitInfo { get; private set; }

        /// <summary>
        /// Position of the user&#39;s gaze.
        /// </summary>
        public Vector3 Position { get; private set; }

        /// <summary>
        /// RaycastHit Normal direction.
        /// </summary>
        public Vector3 Normal { get; private set; }

        private GazeStabilizer gazeStabilizer;
        private Vector3 gazeOrigin;
        private Vector3 gazeDirection;

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 3.a */

            // 3.a: GetComponent GazeStabilizer and assign it to gazeStabilizer.

        }

        private void Update()
        {
            // 2.a: Assign Camera&#39;s main transform position to gazeOrigin.
            gazeOrigin = Camera.main.transform.position;

            // 2.a: Assign Camera&#39;s main transform forward to gazeDirection.
            gazeDirection = Camera.main.transform.forward;

            // 3.a: Using gazeStabilizer, call function UpdateHeadStability.
            // Pass in gazeOrigin and Camera&#39;s main transform rotation.


            // 3.a: Using gazeStabilizer, get the StableHeadPosition and
            // assign it to gazeOrigin.


            UpdateRaycast();
        }

        /// <summary>
        /// Calculates the Raycast hit position and normal.
        /// </summary>
        private void UpdateRaycast()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.a */

            // 2.a: Create a variable hitInfo of type RaycastHit.
            RaycastHit hitInfo;

            // 2.a: Perform a Unity Physics Raycast.
            // Collect return value in public property Hit.
            // Pass in origin as gazeOrigin and direction as gazeDirection.
            // Collect the information in hitInfo.
            // Pass in MaxGazeDistance and RaycastLayerMask.
            Hit = Physics.Raycast(gazeOrigin,
                           gazeDirection,
                           out hitInfo,
                           MaxGazeDistance,
                           RaycastLayerMask);

            // 2.a: Assign hitInfo variable to the HitInfo public property
            // so other classes can access it.
            HitInfo = hitInfo;

            if (Hit)
            {
                // If raycast hit a hologram...

                // 2.a: Assign property Position to be the hitInfo point.
                Position = hitInfo.point;
                // 2.a: Assign property Normal to be the hitInfo normal.
                Normal = hitInfo.normal;
            }
            else
            {
                // If raycast did not hit a hologram...
                // Save defaults ...

                // 2.a: Assign Position to be gazeOrigin plus MaxGazeDistance times gazeDirection.
                Position = gazeOrigin + (gazeDirection * MaxGazeDistance);
                // 2.a: Assign Normal to be the user&#39;s gazeDirection.
                Normal = gazeDirection;
            }
        }
    }
}
```

次に、CusorManager.cs を編集して、以下のことを行います。

1.  アクティブにするカーソルを決めます。
2.  カーソルがホログラム上にあるかどうかに応じてカーソルを更新します。
3.  ユーザーの視線の先にカーソルを位置付けます。

ここでも、CursorManager.cs で "Coding Exercise" というコメントを探して、自身でコードを記述できます。または、以下のコードを使用してもかまいません。

CursorManager.cs
```cs
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// CursorManager class takes Cursor GameObjects.
    /// One that is on Holograms and another off Holograms.
    /// Shows the appropriate Cursor when a Hologram is hit.
    /// Places the appropriate Cursor at the hit position.
    /// Matches the Cursor normal to the hit surface.
    /// </summary>
    public class CursorManager : Singleton<CursorManager>
    {
        [Tooltip(&quot;Drag the Cursor object to show when it hits a hologram.&quot;)]
        public GameObject CursorOnHolograms;

        [Tooltip(&quot;Drag the Cursor object to show when it does not hit a hologram.&quot;)]
        public GameObject CursorOffHolograms;

        void Awake()
        {
            if (CursorOnHolograms == null || CursorOffHolograms == null)
            {
                return;
            }

            // Hide the Cursors to begin with.
            CursorOnHolograms.SetActive(false);
            CursorOffHolograms.SetActive(false);
        }

        void Update()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.b */

            if (GazeManager.Instance == null || CursorOnHolograms == null || CursorOffHolograms == null)
            {
                return;
            }

            if (GazeManager.Instance.Hit)
            {
                // 2.b: SetActive true the CursorOnHolograms to show cursor.
                CursorOnHolograms.SetActive(true);
                // 2.b: SetActive false the CursorOffHolograms hide cursor.
                CursorOffHolograms.SetActive(false);
            }
            else
            {
                // 2.b: SetActive true CursorOffHolograms to show cursor.
                CursorOffHolograms.SetActive(true);
                // 2.b: SetActive false CursorOnHolograms to hide cursor.
                CursorOnHolograms.SetActive(false);
            }

            // 2.b: Assign gameObject&#39;s transform position equals GazeManager&#39;s instance Position.
            gameObject.transform.position = GazeManager.Instance.Position;

            // 2.b: Assign gameObject&#39;s transform up vector equals GazeManager&#39;s instance Normal.
            gameObject.transform.up = GazeManager.Instance.Normal;
        }
    }
}
```

-   \[File\] 、\[Build Settings\] の順に選んで、アプリをリビルドします。
-   App フォルダーを開きます。
-   Visual Studio ソリューション「ModelExplorer」を開きます。
-   \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。
-   カーソルが描画されるようす、カーソルがホログラムに触れると表示が変化するようすを観察します。
-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Interactible Manager」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルで AstroMan オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Interactible」と入力します。検索結果を選びます。

InteractibleManager.cs と Interactible.cs の両方を編集して、以下のことを行います。

1.  InteractibleManager.cs では、視線のレイキャストがヒットした位置をフェッチし、ヒットした GameObject を保存します。
2.  視線の先に操作可能なオブジェクトがある場合は、GazeEntered メッセージを送信します。
3.  操作可能なオブジェクトから視線がそれた場合は、GazeExited メッセージを送信します。
4.  Interactible.cs では、GazeEntered コールバックと GazeExited コールバックを処理します。

InteractibleManager.cs と Interactible.cs で "Coding Exercise" というコメントを探して、自身でコードを記述し、試してみることができます。または、以下のソリューションを使用してもかまいません。

InteractibleManager.cs
```cs
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// InteractibleManager keeps tracks of which GameObject
/// is currently in focus.
/// </summary>
public class InteractibleManager : Singleton<InteractibleManager>
{
    public GameObject FocusedGameObject { get; private set; }

    private GameObject oldFocusedGameObject = null;

    void Start()
    {
        FocusedGameObject = null;
    }

    void Update()
    {
        /* TODO: DEVELOPER CODING EXERCISE 2.c */

        oldFocusedGameObject = FocusedGameObject;

        if (GazeManager.Instance.Hit)
        {
            RaycastHit hitInfo = GazeManager.Instance.HitInfo;
            if (hitInfo.collider != null)
            {
                // 2.c: Assign the hitInfo&#39;s collider gameObject to the FocusedGameObject.
                FocusedGameObject = hitInfo.collider.gameObject;
            }
            else
            {
                FocusedGameObject = null;
            }
        }
        else
        {
            FocusedGameObject = null;
        }

        if (FocusedGameObject != oldFocusedGameObject)
        {
            ResetFocusedInteractible();

            if (FocusedGameObject != null)
            {
                if (FocusedGameObject.GetComponent<Interactible>() != null)
                {
                    // 2.c: Send a GazeEntered message to the FocusedGameObject.
                    FocusedGameObject.SendMessage(&quot;GazeEntered&quot;);
                }
            }
        }
    }

    private void ResetFocusedInteractible()
    {
        if (oldFocusedGameObject != null)
        {
            if (oldFocusedGameObject.GetComponent<Interactible>() != null)
            {
                // 2.c: Send a GazeExited message to the oldFocusedGameObject.
                oldFocusedGameObject.SendMessage(&quot;GazeExited&quot;);
            }
        }
    }
}
```

Interactible.cs

```cs
using UnityEngine;

/// <summary>
/// The Interactible class flags a Game Object as being &quot;Interactible&quot;.
/// Determines what happens when an Interactible is being gazed at.
/// </summary>
public class Interactible : MonoBehaviour
{
    [Tooltip(&quot;Audio clip to play when interacting with this hologram.&quot;)]
    public AudioClip TargetFeedbackSound;
    private AudioSource audioSource;

    private Material[] defaultMaterials;

    void Start()
    {
        defaultMaterials = GetComponent<Renderer>().materials;

        // Add a BoxCollider if the interactible does not contain one.
        Collider collider = GetComponentInChildren<Collider>();
        if (collider == null)
        {
            gameObject.AddComponent<BoxCollider>();
        }

        EnableAudioHapticFeedback();
    }

    private void EnableAudioHapticFeedback()
    {
        // If this hologram has an audio clip, add an AudioSource with this clip.
        if (TargetFeedbackSound != null)
        {
            audioSource = GetComponent<AudioSource>();
            if (audioSource == null)
            {
                audioSource = gameObject.AddComponent<AudioSource>();
            }

            audioSource.clip = TargetFeedbackSound;
            audioSource.playOnAwake = false;
            audioSource.spatialBlend = 1;
            audioSource.dopplerLevel = 0;
        }
    }

    /* TODO: DEVELOPER CODING EXERCISE 2.d */

    void GazeEntered()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to highlight the material when gaze enters.
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, .25f);
        }
    }

    void GazeExited()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to remove highlight on material when gaze exits.
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, 0f);
        }
    }

    void OnSelect()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, .5f);
        }

        // Play the audioSource feedback when we gaze and select a hologram.
        if (audioSource != null &amp;&amp; !audioSource.isPlaying)
        {
            audioSource.Play();
        }

        /* TODO: DEVELOPER CODING EXERCISE 6.a */
        // 6.a: Handle the OnSelect by sending a PerformTagAlong message.

    }
}
```

-   先ほどと同様、プロジェクトをビルドして HoloLens に配置します。
-   視線の先にオブジェクトがあるかないかに応じて何が起こるか観察します。

## 第 3 章 - ターゲット指定のテクニック

### 目標

-   ホログラムへのターゲット指定を容易にする。
-   頭の自然な動きを安定させる。

### 手順

1.  \[Hierarchy\] パネルで Managers オブジェクトを選びます。
2.  \[Inspector\] パネルで \[Add Component\] をクリックします。
3.  メニューの検索ボックスに「Gaze Stabilizer」と入力します。検索結果を選びます。

ここで、GazeStabilizer を使用するように GazeManager を変更します。

1.  Visual Studio で GazeManager スクリプトを開きます。
2.  以下のコードを GazeManager.cs にコピーするか、"Coding Excercise 3.a" を自身で完成します。

GazeManager.cs
```cs
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// GazeManager determines the location of the user&#39;s gaze, hit position and normals.
    /// </summary>
    public class GazeManager : Singleton<GazeManager>
    {
        [Tooltip(&quot;Maximum gaze distance for calculating a hit.&quot;)]
        public float MaxGazeDistance = 5.0f;

        [Tooltip(&quot;Select the layers raycast should target.&quot;)]
        public LayerMask RaycastLayerMask = Physics.DefaultRaycastLayers;

        /// <summary>
        /// Physics.Raycast result is true if it hits a Hologram.
        /// </summary>
        public bool Hit { get; private set; }

        /// <summary>
        /// HitInfo property gives access
        /// to RaycastHit public members.
        /// </summary>
        public RaycastHit HitInfo { get; private set; }

        /// <summary>
        /// Position of the user&#39;s gaze.
        /// </summary>
        public Vector3 Position { get; private set; }

        /// <summary>
        /// RaycastHit Normal direction.
        /// </summary>
        public Vector3 Normal { get; private set; }

        private GazeStabilizer gazeStabilizer;
        private Vector3 gazeOrigin;
        private Vector3 gazeDirection;

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 3.a */

            // 3.a: GetComponent GazeStabilizer and assign it to gazeStabilizer.
            gazeStabilizer = GetComponent<GazeStabilizer>();
        }

        private void Update()
        {
            // 2.a: Assign Camera&#39;s main transform position to gazeOrigin.
            gazeOrigin = Camera.main.transform.position;

            // 2.a: Assign Camera&#39;s main transform forward to gazeDirection.
            gazeDirection = Camera.main.transform.forward;

            // 3.a: Using gazeStabilizer, call function UpdateHeadStability.
            // Pass in gazeOrigin and Camera&#39;s main transform rotation.
            gazeStabilizer.UpdateHeadStability(gazeOrigin, Camera.main.transform.rotation);

            // 3.a: Using gazeStabilizer, get the StableHeadPosition and
            // assign it to gazeOrigin.
            gazeOrigin = gazeStabilizer.StableHeadPosition;

            UpdateRaycast();
        }

        /// <summary>
        /// Calculates the Raycast hit position and normal.
        /// </summary>
        private void UpdateRaycast()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.a */

            // 2.a: Create a variable hitInfo of type RaycastHit.
            RaycastHit hitInfo;

            // 2.a: Perform a Unity Physics Raycast.
            // Collect return value in public property Hit.
            // Pass in origin as gazeOrigin and direction as gazeDirection.
            // Collect the information in hitInfo.
            // Pass in MaxGazeDistance and RaycastLayerMask.
            Hit = Physics.Raycast(gazeOrigin,
                           gazeDirection,
                           out hitInfo,
                           MaxGazeDistance,
                           RaycastLayerMask);

            // 2.a: Assign hitInfo variable to the HitInfo public property
            // so other classes can access it.
            HitInfo = hitInfo;

            if (Hit)
            {
                // If raycast hit a hologram...

                // 2.a: Assign property Position to be the hitInfo point.
                Position = hitInfo.point;
                // 2.a: Assign property Normal to be the hitInfo normal.
                Normal = hitInfo.normal;
            }
            else
            {
                // If raycast did not hit a hologram...
                // Save defaults ...

                // 2.a: Assign Position to be gazeOrigin plus MaxGazeDistance times gazeDirection.
                Position = gazeOrigin + (gazeDirection * MaxGazeDistance);
                // 2.a: Assign Normal to be the user&#39;s gazeDirection.
                Normal = gazeDirection;
            }
        }
    }
}
```

## 第 4 章 - 方向インジケーター

### 目標

-   カーソルに方向インジケーターを追加して、ホログラムを見つけるのを補助する。

### 手順

ここでは DirectionalIndicator.cs を使用します。このコードは、以下のように動作します。

1.  ユーザーの視線の先にホログラムがない場合は方向インジケーターを表示します。
2.  ユーザーの視線の先にホログラムがある場合は方向インジケーターを非表示にします。
3.  ホログラムを指すように方向インジケーターを更新します。

では、始めましょう。

-   \[Hierarchy\] パネルで AstroMan オブジェクトを選び、矢印をクリックしてオブジェクトを展開します。
-   \[Hierarchy\] パネルの AstroMan で DirectionalIndicator オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Direction Indicator」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルの Cursor オブジェクトをドラッグし、\[Inspector\] パネルの \[Cursor\] プロパティにドロップします。
-   \[Project\] パネルの Holograms フォルダーから DirectionalIndicator アセットをドラッグし、\[Inspector\] パネルの \[Directional Indicator\] プロパティにドロップします。
-   アプリをビルドして HoloLens に配置します。
-   方向インジケーター オブジェクトによって宇宙飛行士が見つやすくなることを観察します。

## 第 5 章 - ビルボーディング

### 目標

-   ビルボーディングを使って、ホログラムが常にユーザーの方を向くようにする。

ここでは Billboard.cs を使用して、GameObject が常にユーザーの方を向き続けるようにします。

-   \[Hierarchy\] パネルで AstroMan オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Billboard」と入力します。検索結果を選びます。
-   \[Inspector\] パネルで \[Pivot Axis\] を \[Y\] に設定します。
-   試してみます。先ほどと同様、アプリをビルドして HoloLens に配置します。
-   視点を変えても Billboard オブジェクトがユーザーの方を向くことを確認します。
-   この時点では、AstroMan からスクリプトを削除します。

## 第 6 章 - 追従

### 目標

-   追従を使って、部屋の中でホログラムが動きを追うようにする。

この課題の作業では、次のような設計上の制約に従います。

-   コンテンツからは常に目をそらします。
-   コンテンツは移動の邪魔にならないようにします。
-   頭を固定するコンテンツは望ましくありません。

ここで使用するソリューションは、「追従」アプローチです。

追従オブジェクトがユーザーの視界から完全に外れることはありません。追従オブジェクトは、ユーザーの頭にゴムバンドでくくり付けられたオブジェクトと考えてもかまいません。ユーザーが移動すると、コンテンツは視界の端に向かってスライドし、完全に消えることなく、簡単に目を向けられる範囲内にとどまります。ユーザーが追従オブジェクトの方に目を向けると、オブジェクトが完全に視界に入ります。

-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Gesture Manager」と入力します。検索結果を選びます。

ここでは、以下のように動作する SimpleTagalong.cs を使用します。

1.  追従オブジェクトがカメラの境界内にあるかどうかを判断します。
2.  追従オブジェクトが視錘台内にない場合は、視錘台の内部に入るよう追従オブジェクトを位置付けます。
3.  それ以外の場合は、追従オブジェクトをユーザーから既定の距離に位置付けます。

そのためには、以下を行います。

-   Holograms フォルダーの Tagalong アセットをクリックします。
-   \[Inspector\] パネルで、\[Tag\] ボックスの一覧から \[Add Tag…\] をクリックします。
-   \[+\] 記号をクリックして、名前を「Tag 0」から「TagAlong」に変更します。
-   Holograms フォルダーで Tagalong アセットをクリックし、\[Tag\] ボックスの一覧をクリックします。
-   \[TagAlong\] タグを選びます。
-   最初に、InteractibleAction にメッセージを送信するように Interactible.cs スクリプトを変更する必要があります。
-   "Coding Excercise" を完成するか、以下を使用して Interactible.cs を編集します。

Interactible.cs
```cs
using UnityEngine;

/// <summary>
/// The Interactible class flags a Game Object as being &quot;Interactible&quot;.
/// Determines what happens when an Interactible is being gazed at.
/// </summary>
public class Interactible : MonoBehaviour
{
    [Tooltip(&quot;Audio clip to play when interacting with this hologram.&quot;)]
    public AudioClip TargetFeedbackSound;
    private AudioSource audioSource;

    private Material[] defaultMaterials;

    void Start()
    {
        defaultMaterials = GetComponent<Renderer>().materials;

        // Add a BoxCollider if the interactible does not contain one.
        Collider collider = GetComponentInChildren<Collider>();
        if (collider == null)
        {
            gameObject.AddComponent<BoxCollider>();
        }

        EnableAudioHapticFeedback();
    }

    private void EnableAudioHapticFeedback()
    {
        // If this hologram has an audio clip, add an AudioSource with this clip.
        if (TargetFeedbackSound != null)
        {
            audioSource = GetComponent<AudioSource>();
            if (audioSource == null)
            {
                audioSource = gameObject.AddComponent<AudioSource>();
            }

            audioSource.clip = TargetFeedbackSound;
            audioSource.playOnAwake = false;
            audioSource.spatialBlend = 1;
            audioSource.dopplerLevel = 0;
        }
    }

    /* TODO: DEVELOPER CODING EXERCISE 2.d */

    void GazeEntered()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to highlight the material when gaze enters.
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, .25f);
        }
    }

    void GazeExited()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to remove highlight on material when gaze exits.
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, 0f);
        }
    }

    void OnSelect()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            defaultMaterials[i].SetFloat(&quot;_Highlight&quot;, .5f);
        }

        // Play the audioSource feedback when we gaze and select a hologram.
        if (audioSource != null &amp;&amp; !audioSource.isPlaying)
        {
            audioSource.Play();
        }

        /* TODO: DEVELOPER CODING EXERCISE 6.a */
        // 6.a: Handle the OnSelect by sending a PerformTagAlong message.
        SendMessage(&quot;PerformTagAlong&quot;);
    }
}
```

視線をホログラムに向けると、InteractibleAction.cs スクリプトはカスタム アクションを実行します。では、追従を使用するために更新してみましょう。

-   Scripts フォルダーの InteractibleAction.cs アセットをダブルクリックして Visual Studio で開きます。
-   "Coding Exercise" を完成するか、以下のように変更します。
    -   \[Hierarchy\] パネル上部の検索バーに「ChestButton\_Center」と入力し、検索結果を選びます。
    -   \[Inspector\] パネルで \[Add Component\] をクリックします。
    -   メニューの検索ボックスに「Interactible Action」と入力します。検索結果を選びます。
    -   Holograms フォルダーの Tagalong アセットに移動します。
    -   \[Hierarchy\] パネルで ChestButton\_Center オブジェクトを選びます。TagAlong オブジェクトをドラッグして、\[Inspector\] パネルの \[Object to TagAlong\] プロパティにドロップします。
    -   InteractibleAction スクリプトをダブルクリックして Visual Studio で開きます。

ここで、以下を追加する必要があります。

-   InteractibleAction スクリプトの PerformTagAlong 関数に機能を追加します。
-   視線の先のオブジェクトにビルボーディングを追加して、\[Pivot Axis\] に \[free\] を設定します。
-   その後、シンプルな追従をオブジェクトに追加します。

ソリューションは次のようになります。

InteractibleAction.cs

```cs
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// InteractibleAction performs custom actions when you gaze at the holograms.
/// </summary>
public class InteractibleAction : MonoBehaviour
{
    [Tooltip(&quot;Drag the Tagalong prefab asset you want to display.&quot;)]
    public GameObject ObjectToTagAlong;

    void PerformTagAlong()
    {
        if (ObjectToTagAlong == null)
        {
            return;
        }

        // Recommend having only one tagalong.
        GameObject existingTagAlong = GameObject.FindGameObjectWithTag(&quot;TagAlong&quot;);
        if (existingTagAlong != null)
        {
            return;
        }

        GameObject instantiatedObjectToTagAlong = GameObject.Instantiate(ObjectToTagAlong);

        instantiatedObjectToTagAlong.SetActive(true);

        /* TODO: DEVELOPER CODING EXERCISE 6.b */

        // 6.b: AddComponent Billboard to instantiatedObjectToTagAlong.
        // So it's always facing the user as they move.
        instantiatedObjectToTagAlong.AddComponent<Billboard>();

        // 6.b: AddComponent SimpleTagalong to instantiatedObjectToTagAlong.
        // So it's always following the user as they move.
        instantiatedObjectToTagAlong.AddComponent<SimpleTagalong>();

        // 6.b: Set any public properties you wish to experiment with.
    }
}
```

-   試してみます。アプリをビルドして HoloLens に配置します。
-   コンテンツが、連続的ではなく、邪魔になることもなく、視線の中心に追従するようすを観察します。
