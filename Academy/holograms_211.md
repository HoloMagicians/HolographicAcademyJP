# ホログラム 211

[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/gestures)は、ユーザーの意図を動きで表します。ユーザーはジェスチャーを使ってホログラムを操作できます。このチュートリアルでは、ユーザーの手の動きを追跡し、ユーザー入力に反応して、手の状態と位置に応じてユーザーにフィードバックを提供する方法について説明します。

[*ホログラム 101*](holograms_101.md) では、簡単に空中をタップするジェスチャーを使ってホログラムを操作しました。今回は、空中をタップするよりも複雑なジェスチャーを取り上げ、以下を行うために新しい考え方を示します。

-   ユーザーの手が追跡されていることを検知し、ユーザーにフィードバックを提供する。
-   ナビゲーションのジェスチャーを使って、ホログラムを回転させる。
-   ユーザーの手が視界から外れる直前にフィードバックを提供する。
-   操縦イベントを使って、ユーザーがホログラムを手で動かせるようにする。

このチュートリアルでは、[*ホログラム 210*](holograms_210.md) でビルドした Unity プロジェクト「Model Explorer」を再び使用します。気さくな宇宙飛行士が再び登場し、ジェスチャーの新しい考え方を説明する手助けをします。

## 前提条件

-   適切な[*ツールをインストールして*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)構成した Windows 10 PC。
-   ある程度基本的な C\# プログラミング能力。
-   [*ホログラム 101*](holograms_101.md) の修了。
-   [*ホログラム 210*](holograms_210.md) の修了。
-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#enabling_developer_mode) HoloLens デバイス。

## プロジェクト ファイル

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-211-Gesture.zip)はダウンロードします。Unity 5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-211.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

## 正誤表と注意事項

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\] の順に選び、\[マイ コードのみ\] を無効にする (チェックボックスをオフにする) 必要があります。

## チュートリアルの内容

-   [Unity のセットアップ](holograms_211.md#unity-のセットアップ)
-   [第 1 章 – 手の検出とフィードバック](holograms_211.md#第-1-章---手の検出とフィードバック)
-   [第 2 章 – ナビゲーション](holograms_211.md#第-2-章--ナビゲーション)
-   [第 3 章 – 手の誘導](holograms_211.md#第-3-章--手の誘導)
-   [第 4 章 – 操縦](holograms_211.md#第-4-章---操縦)
-   [第 5 章 – モデルの展開](holograms_211.md#第-5-章---モデルの展開)
-   [終わりに](holograms_211.md#終わりに)

## Unity のセットアップ

### 手順

-   Unity を起動します。
-   \[Open\] を選びます。
-   最初にファイルを解凍した Gesture フォルダーに移動します。
-   Model Explorer フォルダーを探して選びます。
-   \[Select Folder\] をクリックします。
-   \[Project\] パネルの Scenes フォルダーを展開します。
-   ModelExplorer シーンをダブルクリックして、Unity に読み込みます。
-   Unity で、\[File\] (ファイル)、\[Build Settings\] の順に選びます。
-   \[Scenes In Build\] の一覧に \[Scenes/ModelExplorer\] がない場合は、\[Add Open Scenes\] をクリックして、シーンを追加します。
-   \[Platform\]  の一覧で \[Windows Store\] を選び、\[Switch Platform\] をクリックします。
-   \[SDK\] を \[Universal 10\] に、\[UWP Build Type\] を \[D3D\] に設定します。
-   \[Unity C\# Projects\] チェック ボックスをオンにします。
-   \[Build\] をクリックします。
-   \[New Folder\] をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] をクリックすると、Unity によって Visual Studio 向けにプロジェクトのビルドが始まります。
-   Unity によるビルドが終了すると、エクスプローラー ウィンドウが表示されます。
-   App フォルダーを開きます。
-   Visual Studio ソリューション「ModelExplorer」を開きます。
-   上部にあるボックスの一覧で、\[Debug\] を \[Release\]に、\[ARM\] を \[x86\] に変更します。
-   \[ローカル コンピューター\] の横にある矢印をクリックし、\[リモート コンピューター\] を選びます。
-   デバイスの IP アドレスを入力して、\[認証モード\] を \[ユニバーサル (暗号化されていないプロトコル)\] に設定します。\[選択\] をクリックします。HoloLens デバイスの IP アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\] の順にクリックして IP アドレスを確認するか、Cortana に「Hey Cortana, what's my IP address?」と質問します。
-   メニューで \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。デバイスに初めて配置する場合は、Visual Studio とのペアリングが必要です。「[*HoloLens と Visual Studio のペアリング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#pairing_your_device)」の指示に従います。
-   **メモ:** Visual Studio の \[エラー\] パネルに、赤でエラーがいくつか表示されることがあります。これらのエラーは無視しても問題は生じません。\[出力\] パネルに切り替えて、実際のビルドの進捗状況を表示します。\[出力\] パネルにエラーが表示される場合は解決する必要があります (エラーの原因はほぼスクリプト内でのミスによるものです)。

## 第 1 章 - 手の検出とフィードバック

### 目標

-   手を追跡するイベントをサブスクライブする。
-   カーソルのフィードバックを使って、手が追跡されていることをユーザーに示す。

### 手順

-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Hands Manager」と入力します。検索結果を選びます。

HandsManager.cs スクリプトによって以下の手順が実行されます。

1.  SourceDetected イベントと SourceLost イベントをサブスクライブします。
2.  HandDetected 状態を設定します。
3.  SourceDetected イベントと SourceLost イベントのサブスクライブを解除します。

-   \[Hierarchy\] パネルで Cursor オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Cursor Feedback」と入力します。検索結果を選びます。
-   \[Project\] パネルの Holograms フォルダーで HandDetectedFeedback アセットに移動します。
-   HandDetectedFeedback アセットをドラッグして、\[Cursor Feedback (Script)\] コンポーネントの \[Hand Detected Asset\] プロパティにドロップします。
-   \[Hierarchy\] パネルの Cursor オブジェクトを展開します。
-   CursorBillboard をドラッグして、\[Cursor Feedback (Script)\] コンポーネントの \[Feedback Parent\] プロパティにドロップします。

CursorFeedback.cs スクリプトでは以下のような作業が行われます。

1.  HandDetectedFeedback アセットのインスタンスを作成します。
2.  HandDetectedFeedback アセットを CursorBillboard オブジェクトの親にします。
3.  HandDetected 状態に応じて HandDetectedFeedback を有効または無効にします。

### ビルドと配置

-   Unity で、\[File\] 、\[Build Settings\] の順に選んで、アプリをリビルドします。
-   App フォルダーを開きます。
-   Visual Studio ソリューションの ModelExplorer をまだ開いていない場合は開きます。
    -   (セットアップ中にこのプロジェクトを Visual Studio で既にビルドして配置した場合は、VS のインスタンスを開いて、メッセージが表示されたときに \[再読み込み\] をクリックします)
-   Visual Studio で 、\[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。
-   アプリを HoloLens に配置したら、空中をタップするジェスチャーで Fitbox を取り除きます。
-   手が視野に入るまで動かし、人差し指を上に向けて、手の追跡を開始します。
-   手を上下左右に動かします。
-   手が検出された後視界から外れたときに、カーソルが変化するようすを観察します。

## 第 2 章 – ナビゲーション

### 目標

-   ナビゲーション
    ジェスチャーのイベントを使ってホログラムを回転させる。

### 手順

アプリでナビゲーションのジェスチャーを使うには、以下を行うように 4
つのスクリプトを編集します。

1.  HandsManager.cs では、フォーカスが設定されているオブジェクトを追跡します。
2.  GestureManager.cs では、ナビゲーションのイベントを処理します。
3.  GestureAction.cs では、ナビゲーションのジェスチャーが行われたときにオブジェクトを回転させます。
4.  CursorStates.cs では、カーソルによってナビゲーションのフィードバックをユーザーに提供します。

では、始めましょう。

-   Visual Studio で HandsManager.cs スクリプトを開きます。

HandsManager.cs では、フォーカスが設定されている Interactible オブジェクトを追跡します。完成版のコードを HandsManager.cs にコピーするか、コメントを参考に独自にコーディングします。

HandsManager.cs

```cs
using UnityEngine.VR.WSA.Input;
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// HandsManager keeps track of when a hand is detected.
    /// </summary>
    public class HandsManager : Singleton<HandsManager>
    {
        [Tooltip(&quot;Audio clip to play when Finger Pressed.&quot;)]
        public AudioClip FingerPressedSound;
        private AudioSource audioSource;

        /// <summary>
        /// Tracks the hand detected state.
        /// </summary>
        public bool HandDetected
        {
            get;
            private set;
        }

        // Keeps track of the GameObject that the hand is interacting with.
        public GameObject FocusedGameObject { get; private set; }

        void Awake()
        {
            EnableAudioHapticFeedback();

            InteractionManager.SourceDetected += InteractionManager_SourceDetected;
            InteractionManager.SourceLost += InteractionManager_SourceLost;

            /* TODO: DEVELOPER CODE ALONG 2.a */

            // 2.a: Register for SourceManager.SourcePressed event.
            InteractionManager.SourcePressed += InteractionManager_SourcePressed;

            // 2.a: Register for SourceManager.SourceReleased event.
            InteractionManager.SourceReleased += InteractionManager_SourceReleased;

            // 2.a: Initialize FocusedGameObject as null.
            FocusedGameObject = null;
        }

        private void EnableAudioHapticFeedback()
        {
            // If this hologram has an audio clip, add an AudioSource with this clip.
            if (FingerPressedSound != null)
            {
                audioSource = GetComponent<AudioSource>();
                if (audioSource == null)
                {
                    audioSource = gameObject.AddComponent<AudioSource>();
                }

                audioSource.clip = FingerPressedSound;
                audioSource.playOnAwake = false;
                audioSource.spatialBlend = 1;
                audioSource.dopplerLevel = 0;
            }
        }

        private void InteractionManager_SourceDetected(InteractionSourceState hand)
        {
            HandDetected = true;
        }

        private void InteractionManager_SourceLost(InteractionSourceState hand)
        {
            HandDetected = false;

            // 2.a: Reset FocusedGameObject.
            ResetFocusedGameObject();
        }

        private void InteractionManager_SourcePressed(InteractionSourceState hand)
        {
            if (InteractibleManager.Instance.FocusedGameObject != null)
            {
                // Play a select sound if we have an audio source and are not targeting an asset with a select sound.
                if (audioSource != null &amp;&amp; !audioSource.isPlaying &amp;&amp;
                    (InteractibleManager.Instance.FocusedGameObject.GetComponent<Interactible>() != null &amp;&amp;
                    InteractibleManager.Instance.FocusedGameObject.GetComponent<Interactible>().TargetFeedbackSound == null))
                {
                    audioSource.Play();
                }

                // 2.a: Cache InteractibleManager&#39;s FocusedGameObject in FocusedGameObject.
                FocusedGameObject = InteractibleManager.Instance.FocusedGameObject;
            }
        }

        private void InteractionManager_SourceReleased(InteractionSourceState hand)
        {
            // 2.a: Reset FocusedGameObject.
            ResetFocusedGameObject();
        }

        private void ResetFocusedGameObject()
        {
            // 2.a: Set FocusedGameObject to be null.
            FocusedGameObject = null;

            // 2.a: On GestureManager call ResetGestureRecognizers
            // to complete any currently active gestures.
            GestureManager.Instance.ResetGestureRecognizers();
        }

        void OnDestroy()
        {
            InteractionManager.SourceDetected -= InteractionManager_SourceDetected;
            InteractionManager.SourceLost -= InteractionManager_SourceLost;

            // 2.a: Unregister the SourceManager.SourceReleased event.
            InteractionManager.SourceReleased -= InteractionManager_SourceReleased;

            // 2.a: Unregister for SourceManager.SourcePressed event.
            InteractionManager.SourcePressed -= InteractionManager_SourcePressed;
        }
    }
}
```

次に、ユーザーがナビゲーションのジェスチャーを実行するたびに宇宙飛行士を回転させます。

-   \[Hierarchy\] パネルの Cursor をクリックします。
-   HoloToolkit フォルダー、Input フォルダー、Prefabs フォルダーの順に移動し ScrollFeedback アセットを探します。
-   ScrollFeedback アセットをドラッグして、\[Inspector\] パネルにある \[Cursor Feedback (Script)\] コンポーネントの \[Scroll Detected Asset\] プロパティにドロップします。
-   \[Hierarchy\] パネルで AstroMan オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Gesture Action」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルの Managers オブジェクトに移動して選びます。
-   GestureManager スクリプトをダブルクリックして Visual Studio で開きます。

以下の手順を実行するように GestureManager.cs ファイルを編集します。

1.  NavigationRecognizer の新しいインスタンスを GestureRecognizer として作成します。
2.  SetRecognizableGestures を使って、NavigationX ジェスチャーと Tap ジェスチャーを認識させます。
3.  NavigationStarted イベント、NavigationUpdated イベント、NavigationCompleted イベント、NavigationCanceled イベントを処理します。

GestureManager.cs のコメントを参考にコーディングするか、ファイルのコンテンツを以下のコード ブロックに置き換えます。

GestureManager.cs

```cs
using UnityEngine;
using UnityEngine.VR.WSA.Input;

namespace Academy.HoloToolkit.Unity
{
    public class GestureManager : Singleton<GestureManager>
    {
        // Tap and Navigation gesture recognizer.
        public GestureRecognizer NavigationRecognizer { get; private set; }

        // Manipulation gesture recognizer.
        public GestureRecognizer ManipulationRecognizer { get; private set; }

        // Currently active gesture recognizer.
        public GestureRecognizer ActiveRecognizer { get; private set; }

        public bool IsNavigating { get; private set; }

        public Vector3 NavigationPosition { get; private set; }

        public bool IsManipulating { get; private set; }

        public Vector3 ManipulationPosition { get; private set; }

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.b */

            // 2.b: Instantiate the NavigationRecognizer.
            NavigationRecognizer = new GestureRecognizer();

            // 2.b: Add Tap and NavigationX GestureSettings to the NavigationRecognizer&#39;s RecognizableGestures.
            NavigationRecognizer.SetRecognizableGestures(
                GestureSettings.Tap |
                GestureSettings.NavigationX);

            // 2.b: Register for the TappedEvent with the NavigationRecognizer_TappedEvent function.
            NavigationRecognizer.TappedEvent += NavigationRecognizer_TappedEvent;
            // 2.b: Register for the NavigationStartedEvent with the NavigationRecognizer_NavigationStartedEvent function.
            NavigationRecognizer.NavigationStartedEvent += NavigationRecognizer_NavigationStartedEvent;
            // 2.b: Register for the NavigationUpdatedEvent with the NavigationRecognizer_NavigationUpdatedEvent function.
            NavigationRecognizer.NavigationUpdatedEvent += NavigationRecognizer_NavigationUpdatedEvent;
            // 2.b: Register for the NavigationCompletedEvent with the NavigationRecognizer_NavigationCompletedEvent function.
            NavigationRecognizer.NavigationCompletedEvent += NavigationRecognizer_NavigationCompletedEvent;
            // 2.b: Register for the NavigationCanceledEvent with the NavigationRecognizer_NavigationCanceledEvent function.
            NavigationRecognizer.NavigationCanceledEvent += NavigationRecognizer_NavigationCanceledEvent;

            // Instantiate the ManipulationRecognizer.
            ManipulationRecognizer = new GestureRecognizer();

            // Add the ManipulationTranslate GestureSetting to the ManipulationRecognizer&#39;s RecognizableGestures.
            ManipulationRecognizer.SetRecognizableGestures(
                GestureSettings.ManipulationTranslate);

            // Register for the Manipulation events on the ManipulationRecognizer.
            ManipulationRecognizer.ManipulationStartedEvent += ManipulationRecognizer_ManipulationStartedEvent;
            ManipulationRecognizer.ManipulationUpdatedEvent += ManipulationRecognizer_ManipulationUpdatedEvent;
            ManipulationRecognizer.ManipulationCompletedEvent += ManipulationRecognizer_ManipulationCompletedEvent;
            ManipulationRecognizer.ManipulationCanceledEvent += ManipulationRecognizer_ManipulationCanceledEvent;

            ResetGestureRecognizers();
        }

        void OnDestroy()
        {
            // 2.b: Unregister the Tapped and Navigation events on the NavigationRecognizer.
            NavigationRecognizer.TappedEvent -= NavigationRecognizer_TappedEvent;

            NavigationRecognizer.NavigationStartedEvent -= NavigationRecognizer_NavigationStartedEvent;
            NavigationRecognizer.NavigationUpdatedEvent -= NavigationRecognizer_NavigationUpdatedEvent;
            NavigationRecognizer.NavigationCompletedEvent -= NavigationRecognizer_NavigationCompletedEvent;
            NavigationRecognizer.NavigationCanceledEvent -= NavigationRecognizer_NavigationCanceledEvent;

            // Unregister the Manipulation events on the ManipulationRecognizer.
            ManipulationRecognizer.ManipulationStartedEvent -= ManipulationRecognizer_ManipulationStartedEvent;
            ManipulationRecognizer.ManipulationUpdatedEvent -= ManipulationRecognizer_ManipulationUpdatedEvent;
            ManipulationRecognizer.ManipulationCompletedEvent -= ManipulationRecognizer_ManipulationCompletedEvent;
            ManipulationRecognizer.ManipulationCanceledEvent -= ManipulationRecognizer_ManipulationCanceledEvent;
        }

        /// <summary>
        /// Revert back to the default GestureRecognizer.
        /// </summary>
        public void ResetGestureRecognizers()
        {
            // Default to the navigation gestures.
            Transition(NavigationRecognizer);
        }

        /// <summary>
        /// Transition to a new GestureRecognizer.
        /// </summary>
        /// <param name=&quot;newRecognizer&quot;>The GestureRecognizer to transition to.</param>
        public void Transition(GestureRecognizer newRecognizer)
        {
            if (newRecognizer == null)
            {
                return;
            }

            if (ActiveRecognizer != null)
            {
                if (ActiveRecognizer == newRecognizer)
                {
                    return;
                }

                ActiveRecognizer.CancelGestures();
                ActiveRecognizer.StopCapturingGestures();
            }

            newRecognizer.StartCapturingGestures();
            ActiveRecognizer = newRecognizer;
        }

        private void NavigationRecognizer_NavigationStartedEvent(InteractionSourceKind source, Vector3 relativePosition, Ray ray)
        {
            // 2.b: Set IsNavigating to be true.
            IsNavigating = true;

            // 2.b: Set NavigationPosition to be relativePosition.
            NavigationPosition = relativePosition;
        }

        private void NavigationRecognizer_NavigationUpdatedEvent(InteractionSourceKind source, Vector3 relativePosition, Ray ray)
        {
            // 2.b: Set IsNavigating to be true.
            IsNavigating = true;

            // 2.b: Set NavigationPosition to be relativePosition.
            NavigationPosition = relativePosition;
        }

        private void NavigationRecognizer_NavigationCompletedEvent(InteractionSourceKind source, Vector3 relativePosition, Ray ray)
        {
            // 2.b: Set IsNavigating to be false.
            IsNavigating = false;
        }

        private void NavigationRecognizer_NavigationCanceledEvent(InteractionSourceKind source, Vector3 relativePosition, Ray ray)
        {
            // 2.b: Set IsNavigating to be false.
            IsNavigating = false;
        }

        private void ManipulationRecognizer_ManipulationStartedEvent(InteractionSourceKind source, Vector3 position, Ray ray)
        {
            if (HandsManager.Instance.FocusedGameObject != null)
            {
                IsManipulating = true;

                ManipulationPosition = position;

                HandsManager.Instance.FocusedGameObject.SendMessageUpwards(&quot;PerformManipulationStart&quot;, position);
            }
        }

        private void ManipulationRecognizer_ManipulationUpdatedEvent(InteractionSourceKind source, Vector3 position, Ray ray)
        {
            if (HandsManager.Instance.FocusedGameObject != null)
            {
                IsManipulating = true;

                ManipulationPosition = position;

                HandsManager.Instance.FocusedGameObject.SendMessageUpwards(&quot;PerformManipulationUpdate&quot;, position);
            }
        }

        private void ManipulationRecognizer_ManipulationCompletedEvent(InteractionSourceKind source, Vector3 position, Ray ray)
        {
            IsManipulating = false;
        }

        private void ManipulationRecognizer_ManipulationCanceledEvent(InteractionSourceKind source, Vector3 position, Ray ray)
        {
            IsManipulating = false;
        }

        private void NavigationRecognizer_TappedEvent(InteractionSourceKind source, int tapCount, Ray ray)
        {
            GameObject focusedObject = InteractibleManager.Instance.FocusedGameObject;

            if (focusedObject != null)
            {
                focusedObject.SendMessageUpwards(&quot;OnSelect&quot;);
            }
        }
    }
}
```

次に、Visual Studio で GestureAction.cs を開きます。このスクリプトを以下を行うように編集します。

1.  ナビゲーションのジェスチャーが実行されるたびに AstroMan オブジェクトを回転させます。
2.  rotationFactor を計算して、オブジェクトに適用する回転の量を制御します。
3.  ユーザーが手を左右に動かすと、y 軸を中心にオブジェクトを回転させます。

スクリプトでこのコーディングを完成させるか、コードを以下の完成版のソリューションに置き換えます。

GestureAction.cs

```cs
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// GestureAction performs custom actions based on
/// which gesture is being performed.
/// </summary>
public class GestureAction : MonoBehaviour
{
    [Tooltip(&quot;Rotation max speed controls amount of rotation.&quot;)]
    public float RotationSensitivity = 10.0f;

    private Vector3 manipulationPreviousPosition;

    private float rotationFactor;

    void Update()
    {
        PerformRotation();
    }

    private void PerformRotation()
    {
        if (GestureManager.Instance.IsNavigating &amp;&amp;
            (!ExpandModel.Instance.IsModelExpanded ||
            (ExpandModel.Instance.IsModelExpanded &amp;&amp; HandsManager.Instance.FocusedGameObject == gameObject)))
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.c */

            // 2.c: Calculate rotationFactor based on GestureManager&#39;s NavigationPosition.X and multiply by RotationSensitivity.
            // This will help control the amount of rotation.
            rotationFactor = GestureManager.Instance.NavigationPosition.x * RotationSensitivity;

            // 2.c: transform.Rotate along the Y axis using rotationFactor.
            transform.Rotate(new Vector3(0, -1 * rotationFactor, 0));
        }
    }

    void PerformManipulationStart(Vector3 position)
    {
        manipulationPreviousPosition = position;
    }

    void PerformManipulationUpdate(Vector3 position)
    {
        if (GestureManager.Instance.IsManipulating)
        {
            /* TODO: DEVELOPER CODING EXERCISE 4.a */

            Vector3 moveVector = Vector3.zero;

            // 4.a: Calculate the moveVector as position - manipulationPreviousPosition.

            // 4.a: Update the manipulationPreviousPosition with the current position.

            // 4.a: Increment this transform&#39;s position by the moveVector.
        }
    }
}
```

### ビルドと配置

-   Unity でアプリをリビルド後、Visual Studio でビルドして配置し、HoloLens でアプリを実行します。
-   宇宙飛行士に視線を向けると、カーソルの両側に 2 つの矢印が表示されます。この新しい目印は、宇宙飛行士を回転できることを示します。
-   手を構える (人差し指を上に向ける) と、HoloLens が手の追跡を開始します。
-   宇宙飛行士を回転させるには、人差し指を下ろして、親指と人差し指でつまむようにしてから、手を左右に動かして NavigationX ジェスチャーをトリガーします。

## 第 3 章 – 手の誘導

### 目標

-   手の誘導スコアを使って、手の追跡が途切れるタイミングを予測できるようにする。
-   カーソルにフィードバックを提供して、ユーザーの手がカメラの視界の端に近づいたことを知らせる。

### 手順

-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Hand Guidance」と入力します。検索結果を選びます。
-   \[Project\] パネルで HoloToolkit フォルダー、Input フォルダー、Prefabs フォルダーの順に移動し、HandGuidanceFeedback アセットを探します。
-   HandGuidanceFeedback アセットをドラッグし、\[Inspector\] パネルの \[Hand Guidance Indicator\] プロパティにドロップします。
-   \[Hierarchy\] パネルの Cursor オブジェクトを展開します。
-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Hierarchy\] パネルの CursorBillboard をドラッグして、\[Inspector\] (インスペクター) パネルの \[Indicator Parent\] プロパティにドロップします。

### ビルドと配置

-   Unity でアプリをリビルド後、Visual Studio でビルドして配置し、HoloLens でアプリを実行します。
-   手が視界に入るまで動かし、人差し指を上に向て、手の追跡を開始します。
-   ナビゲーションのジェスチャー (人差し指と親指でつまむ) を使って宇宙飛行士を回転させます。
-   手を、上下左右に大きく動かします。
-   手がジェスチャー フレームの端に近づくと、カーソルの横に矢印が表示され、手の追跡が途切れることを警告します。矢印が示すのは、追跡が途切れないように手を動かす方向です。

## 第 4 章 - 操縦

### 目標

-   操縦のイベントを使って、宇宙飛行士を手で動かす。
-   カーソルにフィードバックを提供し、いつ操縦できるかユーザーがわかるようにする。

### 手順

GestureManager.cs と AstronautManager.cs
によって、以下のことが可能になります。

1.  「Move Astronaut」 というキーワードを発話すると、操縦のジェスチャーを有効にします。
2.  Manipulation Gesture Recognizer を使うように切り替えます。
3.  ナビゲーションと操縦のジェスチャーを切り替えるとき、GestureRecognizer の遷移を管理します。

では、始めましょう。

-   \[Hierarchy\] パネルで Managers オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Astronaut Manager」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルの Cursor をクリックします。
-   \[Project\] パネルで Holotoolkit フォルダー、Input フォルダー、Prefabs フォルダーの順に移動し、PathingFeedback アセットを探します。
-   PathingFeedback アセットをドラッグし、\[Inspector\] パネルの \[Cursor States (Script)\] コンポーネントの \[Pathing Detected Asset\] プロパティにドロップします。

ここで、GestureAction.cs にコードを追加して、以下を可能にします。

1.  関数 PerformManipulationUpdate にコードを追加し、操縦のジェスチャーを検出したら宇宙飛行士を移動します。
2.  移動のベクトルを計算して、手の位置を基に宇宙飛行士の移動先を決定します。
3.  新しい位置に宇宙飛行士を移動します。

GestureAction.cs でのコメントを参考にコーディングを完成するか、以下の完成版ソリューションを使用します。

GestureAction.cs

```cs
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// GestureAction performs custom actions based on
/// which gesture is being performed.
/// </summary>
public class GestureAction : MonoBehaviour
{
    [Tooltip(&quot;Rotation max speed controls amount of rotation.&quot;)]
    public float RotationSensitivity = 10.0f;

    private Vector3 manipulationPreviousPosition;

    private float rotationFactor;

    void Update()
    {
        PerformRotation();
    }

    private void PerformRotation()
    {
        if (GestureManager.Instance.IsNavigating &amp;&amp;
            (!ExpandModel.Instance.IsModelExpanded ||
            (ExpandModel.Instance.IsModelExpanded &amp;&amp; HandsManager.Instance.FocusedGameObject == gameObject)))
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.c */

            // 2.c: Calculate rotationFactor based on GestureManager&#39;s NavigationPosition.X and multiply by RotationSensitivity.
            // This will help control the amount of rotation.
            rotationFactor = GestureManager.Instance.NavigationPosition.x * RotationSensitivity;

            // 2.c: transform.Rotate along the Y axis using rotationFactor.
            transform.Rotate(new Vector3(0, -1 * rotationFactor, 0));
        }
    }

    void PerformManipulationStart(Vector3 position)
    {
        manipulationPreviousPosition = position;
    }

    void PerformManipulationUpdate(Vector3 position)
    {
        if (GestureManager.Instance.IsManipulating)
        {
            /* TODO: DEVELOPER CODING EXERCISE 4.a */

            Vector3 moveVector = Vector3.zero;

            // 4.a: Calculate the moveVector as position - manipulationPreviousPosition.
            moveVector = position - manipulationPreviousPosition;

            // 4.a: Update the manipulationPreviousPosition with the current position.
            manipulationPreviousPosition = position;

            // 4.a: Increment this transform's position by the moveVector.
            transform.position += moveVector;
        }
    }
}
```

### ビルドと配置

-   Unity でアプリをリビルド後、Visual Studio でビルドして配置し、HoloLens でアプリを実行します。
-   HoloLens の前で手を動かし、人差し指を上に向けて追跡を開始します。
-   宇宙飛行士の上にカーソルを移動し、フォーカスを設定します。
-   「Move Astronaut」 と発話し、操縦のジェスチャーを使って宇宙飛行士を動かします。
-   カーソルの周りに 4 つの矢印が表示され、プログラムが操縦のイベントに応答しているのがわかります。
-   人差し指を親指に触れるまで下げ、つまむようにします。
-   頭を動かすと、宇宙飛行士も移動します。これが操縦です。
-   人差し指を上に向け、宇宙飛行士の操縦を停止します。
-   メモ: 手を動かす前に「Move Astronaut」 と発話しないと、ナビゲーションのジェスチャーが使用されます。

## 第 5 章 - モデルの展開

### 目標

-   宇宙飛行士のモデルを複数の小さなパーツに展開し、ユーザーが操作できるようにする。
-   ナビゲーションと操縦のジェスチャーを使って、各パーツを個別に動かす。

### 手順

ここでは、以下の作業を行います。

1.  宇宙飛行士のモデルを展開するため、「Expand Model」 という新しいキーワードを追加します。
2.  モデルを元の形状に戻すために、「Reset Model」 という新しいキーワードを追加します。

AstronautManager.cs でコメントを参考にコーディングを完成するか、以下の完成版のコードをコピーして貼り付けます。

AstronautManager.cs

```cs
using Academy.HoloToolkit.Unity;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Windows.Speech;

public class AstronautManager : Singleton<AstronautManager>
{
    float expandAnimationCompletionTime;
    // Store a bool for whether our astronaut model is expanded or not.
    bool isModelExpanding = false;

    // KeywordRecognizer object.
    KeywordRecognizer keywordRecognizer;

    // Defines which function to call when a keyword is recognized.
    delegate void KeywordAction(PhraseRecognizedEventArgs args);
    Dictionary<string, KeywordAction> keywordCollection;

    void Start()
    {
        keywordCollection = new Dictionary<string, KeywordAction>();

        // Add keyword to start manipulation.
        keywordCollection.Add(&quot;Move Astronaut&quot;, MoveAstronautCommand);

        // Add keyword Expand Model to call the ExpandModelCommand function.
        keywordCollection.Add(&quot;Expand Model&quot;, ExpandModelCommand);

        // Add keyword Reset Model to call the ResetModelCommand function.
        keywordCollection.Add(&quot;Reset Model&quot;, ResetModelCommand);

        // Initialize KeywordRecognizer with the previously added keywords.
        keywordRecognizer = new KeywordRecognizer(keywordCollection.Keys.ToArray());
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        KeywordAction keywordAction;

        if (keywordCollection.TryGetValue(args.text, out keywordAction))
        {
            keywordAction.Invoke(args);
        }
    }

    private void MoveAstronautCommand(PhraseRecognizedEventArgs args)
    {
        GestureManager.Instance.Transition(GestureManager.Instance.ManipulationRecognizer);
    }

    private void ResetModelCommand(PhraseRecognizedEventArgs args)
    {
        // Reset local variables.
        isModelExpanding = false;

        // Disable the expanded model.
        ExpandModel.Instance.ExpandedModel.SetActive(false);

        // Enable the idle model.
        ExpandModel.Instance.gameObject.SetActive(true);

        // Enable the animators for the next time the model is expanded.
        Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();
        foreach (Animator animator in expandedAnimators)
        {
            animator.enabled = true;
        }

        ExpandModel.Instance.Reset();
    }

    private void ExpandModelCommand(PhraseRecognizedEventArgs args)
    {
        // Swap out the current model for the expanded model.
        GameObject currentModel = ExpandModel.Instance.gameObject;

        ExpandModel.Instance.ExpandedModel.transform.position = currentModel.transform.position;
        ExpandModel.Instance.ExpandedModel.transform.rotation = currentModel.transform.rotation;
        ExpandModel.Instance.ExpandedModel.transform.localScale = currentModel.transform.localScale;

        currentModel.SetActive(false);
        ExpandModel.Instance.ExpandedModel.SetActive(true);

        // Play animation.  Ensure the Loop Time check box is disabled in the inspector for this animation to play it once.
        Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();
        // Set local variables for disabling the animation.
        if (expandedAnimators.Length > 0)
        {
            expandAnimationCompletionTime = Time.realtimeSinceStartup + expandedAnimators[0].runtimeAnimatorController.animationClips[0].length * 0.9f;
        }

        // Set the expand model flag.
        isModelExpanding = true;

        ExpandModel.Instance.Expand();
    }

    public void Update()
    {
        if (isModelExpanding &amp;&amp; Time.realtimeSinceStartup >= expandAnimationCompletionTime)
        {
            isModelExpanding = false;

            Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();

            foreach (Animator animator in expandedAnimators)
            {
                animator.enabled = false;
            }
        }
    }
}
```

### ビルドと配置

-   試してみます。アプリをビルドして HoloLens に配置します。
-   「Expand Model」 と発話し、宇宙飛行士のモデルが展開されるのを確認します。
-   ナビゲーションのジェスチャーを使って、宇宙服のパーツを個別に回転させます。
-   「Move Astronaut」 と発話してから操縦のジェスチャーを使って、宇宙服のパーツを個別に移動します。
-   「Reset Model」 と発話して、モデルを元の形状に戻します。

## 終わりに

お疲れ様でした。これで、チュートリアル「ホログラム 211 - ジェスチャー」は終わりです。

-   手の追跡、ナビゲーション、操縦のイベントを検出して反応する方法を学びました。
-   ナビゲーションのジェスチャーと操縦のジェスチャーの違いを学びました。
-   手を検出したとき、手が画面から外れそうなとき、オブジェクトが異なる操作 (ナビゲーションと操縦) をサポートしているときにカーソルを変更して、ビジュアル フィードバックを提供する方法を学びました。
