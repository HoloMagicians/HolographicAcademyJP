# ホログラム 240

ホログラムは、空間内をあちこち移動する動きに従って適切な位置を保つようにすることで、仮想世界の中で存在感が与えられます。HoloLensはホログラムを適切な位置に保つため、さまざまな[*座標系*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/coordinate_systems)を使ってオブジェクトの位置や向きを追跡します。このような座標系をデバイス間で共有すると、共通のエクスペリエンスを生み出すことができ、共有されたホログラフィックの世界に参加することができます。

このチュートリアルでは、以下を習得します。

-   エクスペリエンスを共有するためのネットワークのセットアップ。
-   HoloLens デバイス間でのホログラムの共有。
-   共有されたホログラフィックの世界での他のユーザーの検出。
-   他のプレイヤーを標的にして弾を発射するようなインタラクティブな共有エクスペリエンスの作成。

## 前提条件

-   適切な[*ツールをインストール*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)して構成した、インターネットにアクセスできる Windows 10 PC。
-   [*開発用に構成*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#enabling_developer_mode)した HoloLens デバイスを 2 基以上。

## プロジェクト ファイル

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-240-SharedHolograms.zip)はダウンロードします。Unity 5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-240.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。フォルダー名はそのまま SharedHolograms を使います。

## チュートリアルの内容

-   [第 1 章 -「ホログラム」の世界](holograms_240.md#第-1-章---ホログラムの世界)
-   [第 2 章 - 操作](holograms_240.md#第-2-章---操作)
-   [第 3 章 - 共有座標](holograms_240.md#第-3-章---共有座標)
-   [第 4 章 - 検出](holograms_240.md#第-4-章---検出)
-   [第 5 章 - 配置](holograms_240.md#第-5-章---配置)
-   [第 6 章 - 現実世界の物理特性](holograms_240.md#第-6-章---現実世界の物理特性)
-   [第 7 章 - グランドフィナーレ](holograms_240.md#第-7-章---グランドフィナーレ)

## 第 1 章 - 「ホログラム」の世界

この章では、このチュートリアル最初の Unity プロジェクトをセットアップし、ビルドと配置のプロセスについて順を追って説明します。

### 目標

-   ホログラフィック アプリを開発するために Unity をセットアップする。
-   ホログラムを見る。

### 手順

-   Unity を起動します。
-   \[Open\] を選びます。
-   最初にファイルを解凍した SharedHologramsフォルダーの場所を入力します。
-   \[Project Name\] を選び、\[Select Folder\] をクリックします。
-   \[Hierarchy\] パネルで、\[Main Camera\] を右クリックし、\[Delete\] を選びます。
-   HoloToolkit-Sharing-240 フォルダー、Prefabs フォルダー、Cameraフォルダーの順に移動し Main Camera オブジェクトを探します。
-   Main Camera をドラッグし \[Hierarchy\] パネルにドロップします。
-   \[Hierarchy\] パネルで、\[Create\] 、\[Create Empty\] の順にクリックします。
-   新しく作成された GameObject を右クリックして、\[Rename\] を選びます。
-   GameObject の名前を「HologramCollection」に変更します。
-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルの \[Transform\] コンポーネントで \[Position\] を (x:0, y:-0.25, z:2) に設定します。
-   \[Project\] パネルの Holograms フォルダーで EnergyHub アセットに移動します。
-   EnergyHub オブジェクトを \[Project\] パネルからドラッグして HologramCollection の子になるように \[Hierarchy\] パネルにドラッグします。
-   \[File\] 、\[Save Scene As\] の順に選びます。
-   シーンに「SharedHolograms」という名前を付けて、\[Save\] をクリックします。
-   Unity で \[Play\] をクリックしてホログラムをプレビューします。
-   再度 \[Play\] をクリックすると、プレビューモードが停止します。

### Unity から Visual Studio へのプロジェクトのエクスポート

-   Unity で、\[File\] 、\[Build Settings\] の順に選びます。
-   \[Add Open Scenes\] をクリックして、シーンを追加します。
-   \[Platform\] の一覧で \[Windows Store\] を選び、\[Switch Platform\] をクリックします。
-   \[SDK\] を \[Universal 10\] に設定します。
-   \[Target device\] を \[HoloLens\] に、\[UWP Build Type\] を \[D3D\] に設定します。
-   \[Unity C\# Projects\] チェックボックスをオンにします。
-   \[Build\] をクリックします。
-   表示されるファイル エクスプローラー ウィンドウで、\[New Folder\] をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] をクリックします。
-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。
-   App フォルダーを開きます。
-   SharedHolograms.sln を開いて Visual Studio を起動します。
-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から \[Release\] 、\[ARM\] から \[X86\] に変更します。
-   \[ローカル コンピューター\] の横にある矢印をクリックして、\[リモート
    コンピューター\] を選びます。
    -   \[アドレス\] をお使いの HoloLens の名前または IP アドレスに設定します。デバイスの IP アドレスがわからない場合は、\[設定\] 、\[ネットワークとインターネット\] 、\[詳細オプション\] の順にクリックして IP アドレスを確認するか、Cortana に「私の IP アドレスを教えて」と質問します。
    -   \[認証モード\] は \[ユニバーサル\] のままにします。
    -   \[選択\] をクリックします。
-   \[デバッグ\] 、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。デバイスに初めて配置する場合は、[*Visual Studioとのペアリング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#pairing_your_device)が必要です。
-   HoloLens を着用して、EnergyHub ホログラムを探します。

## 第 2 章 - 操作

この章では、ホログラムを操作します。まず、[*視線*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/gaze)がわかるようにカーソルを追加します。次に、[*ジェスチャー*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/gestures)を追加し、手を使ってホログラムを空間に置きます。

### 目標

-   視線入力を使ってカーソルを制御する。
-   ジェスチャー入力を使ってホログラムを操作する。

### 手順

### 視線

-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Gaze Manager」と入力します。検索結果を選びます。
-   HoloToolkit-Sharing-240 フォルダー、Prefabs フォルダー、Inputフォルダーの順に移動し Cursor アセットを探します。
-   Cursor アセットをドラッグして、\[Hierarchy\] パネルにドロップします。

### ジェスチャー

-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Add Component\] をクリックして、検索フィールドに「Gesture Manager」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルで、HologramCollection を展開します。
-   子の EnergyHub オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「Hologram Placement」と入力します。検索結果を選びます。
-   \[File\] 、\[Save Scene\] の順に選び、シーンを保存します。

### 配置と実行

-   前の章の手順を使ってビルドし、HoloLens に配置します。
-   HoloLens でアプリを起動後、頭をぐるりと動かすと EnergyHub が視線に従うようすがわかります。
-   ホログラムに視線を合わせるとカーソルが現れ、視線の先にホログラムがない場合は点光線が変わるようすがわかります。
-   空中をタップして、ホログラムを置きます。この時点のプロジェクトでは、ホログラムを一度しか置くことができません(もう一度試すにはアプリを再配置します)。

## 第 3 章 - 共有座標

ホログラムを見て操作するのも楽しいですが、先に進みましょう。今度は最初の共有エクスペリエンスを設定します。つまり、全員で一緒に見ることができるホログラムにします。

### 目標

-   共有エクスペリエンスのためにネットワークをセットアップする。
-   共通参照ポイントを確立する。
-   複数のデバイスで座標系を共有する。
-   全員で同じホログラムを見る。

### 手順

-   \[Project\] パネルで HoloToolkit-Sharing-240 フォルダー、Prefabs フォルダー、Sharing フォルダーの順に移動します。
-   Sharing をドラッグし \[Hierarchy\] パネルにドロップします。

次に、共有サービスを起動する必要があります。以下の手順は、共有エクスペリエンスに参加する1 台の PC のみで行う必要があります。

-   Unity 上部のメニューで \[HoloToolkit-Sharing-240\] メニューを選びます。
-   ドロップダウンで \[Launch Sharing Service\] を選びます。
-   \[Private Network\] オプションのチェックボックスをオンにし、ファイアウォールのプロンプトが表示されたら \[Allow Access\] をクリックします。
-   \[Sharing Service\] コンソール ウィンドウに表示される IPv4 アドレスを書き留めます。これはサービスを実行しているコンピューターと同じ IP アドレスです。

これ以降の手順は共有エクスペリエンスに参加するすべての PC で行います。

-   \[Hierarchy\] パネルで Sharing オブジェクトを選びます。
-   \[Inspector\] パネルの \[Sharing Stage\] コンポーネントで、\[Server Addres\] を「localhost」から SharingService.exe を実行しているコンピューターの Ipv4 アドレスに変更します。
-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   検索ボックスに「Import Export Anchor Manager」と入力します。検索結果を選びます。
-   \[Project\] パネルで Scripts フォルダーに移動します。
-   HologramPlacement スクリプトをダブルクリックして Visual Studio で開きます。
-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs
```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the anchor model.
    /// The anchor model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    private bool animationPlayed = false;

    void Start()
    {
        // We care about getting updates for the anchor transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransfrom;

        // And when a new user join we will send the anchor transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the anchor if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    void Update()
    {
        if (GotTransform)
        {
            if (ImportExportAnchorManager.Instance.AnchorEstablished &&
                animationPlayed == false)
            {
                // This triggers the animation sequence for the anchor model and
                // puts the cool materials on the model.
                GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                animationPlayed = true;
            }
        }
        else
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        // Put the anchor 2m in front of the user.
        Vector3 retval = Camera.main.transform.position + Camera.main.transform.forward * 2;

        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransfrom(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the anchor to do its animation and
        // swap its materials.
        if (GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    public void ResetStage()
    {
        // We'll use this later.
    }
}
```

-   Unity に戻り、\[Hierarchy\] パネルの HologramCollection を選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   メニューの検索ボックスに「App State Manager」と入力します。検索結果を選びます。

### 配置と実行

-   HoloLens デバイス用にプロジェクトをビルドします。
-   最初に配置する HoloLens を 1 つ指定します。EnergyHub を置く前にサービスにアップロードされるアンカーを待機する必要があります(これには 30～60秒かかります)。アップロードが完了するまで、タップするジェスチャーは無視されます。
-   EnergyHub を置くと、その場所がサービスにアップロードされます。その後、他のすべての HoloLens デバイスにアプリを配置できます。
-   新たな HoloLens がセッションに参加した直後は、そのデバイスの EnergyHub の場所が正しくない場合があります。ただし、アンカーと EnergyHub の場所がサービスからダウンロードされるとすぐに､ EnergyHub は新しい共有の場所に移動します。30～60秒以内に正しい場所に移動しない場合は、アンカーを設定するときに最初の HoloLens がいた場所まで歩き、環境について多くの手掛かりを集めます。それでも場所が確定されない場合は、デバイスにアプリを再配置します。
-   デバイスの準備がすべて整いアプリを実行したら、EnergyHub を探します。ホログラムの場所とテキストが表示される方向に問題がないことを確認します。

## 第 4 章 - 検出

これで全員に同じホログラムが見えるようになります。今度は、ホログラムを共有する世界に接続している他の全員を見つけます。この章では、同じ共有セッション内の他のすべての
HoloLens デバイスの頭の場所と回転を把握します。

### 目標

-   共有エクスペリエンスに参加している全員を互いに見つける。
-   プレイヤーのアバターを選び、共有する。
-   全員の頭の横にプレイヤーのアバターを表示する。

### 手順

-   \[Project\] パネルで Holograms フォルダーに移動します。
-   PlayerAvatarStore をドラッグして、\[Hierarchy\] パネルにドロップします。
-   \[Project\] パネルで Scripts フォルダーに移動します。
-   AvatarSelector スクリプトをダブルクリックして Visual Studio で開きます。
-   コンテンツを以下のコードに置き換えます。

AvatarSelector.cs
```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Script to handle the user selecting the avatar.
/// </summary>
public class AvatarSelector : MonoBehaviour
{
    /// <summary>
    /// This is the index set by the PlayerAvatarStore for the avatar.
    /// </summary>
    public int AvatarIndex { get; set; }

    /// <summary>
    /// Called when the user is gazing at this avatar and air taps it.
    /// This sends the user's selection to the rest of the devices in the experience.
    /// </summary>
    void OnSelect()
    {
        PlayerAvatarStore.Instance.DismissAvatarPicker();

        LocalPlayerManager.Instance.SetUserAvatar(AvatarIndex);        
    }

    void Start()
    {
        // Add Billboard component so the avatar always faces the user.
        Billboard billboard = gameObject.GetComponent<Billboard>();
        if (billboard == null)
        {
            billboard = gameObject.AddComponent<Billboard>();
        }

        // Lock rotation along the Y axis.
        billboard.PivotAxis = PivotAxis.Y;
    }
}
```

-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   検索ボックスに「Local Player Manager」と入力します。検索結果を選びます。
-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   検索ボックスに「Remote Player Manager」と入力します。検索結果を選びます。
-   Visual Studio で HologramPlacement スクリプトを開きます。
-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs
```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the model.
    /// The model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    /// <summary>
    /// When the experience starts, we disable all of the rendering of the model.
    /// </summary>
    List<MeshRenderer> disabledRenderers = new List<MeshRenderer>();

    void Start()
    {
        // When we first start, we need to disable the model to avoid it obstructing the user picking a hat.
        DisableModel();

        // We care about getting updates for the model transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransfrom;

        // And when a new user join we will send the model transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the model if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    /// <summary>
    /// Turns off all renderers for the model.
    /// </summary>
    void DisableModel()
    {
        foreach (MeshRenderer renderer in gameObject.GetComponentsInChildren<MeshRenderer>())
        {
            if (renderer.enabled)
            {
                renderer.enabled = false;
                disabledRenderers.Add(renderer);
            }
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = false;
        }
    }

    /// <summary>
    /// Turns on all renderers that were disabled.
    /// </summary>
    void EnableModel()
    {
        foreach (MeshRenderer renderer in disabledRenderers)
        {
            renderer.enabled = true;
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = true;
        }

        disabledRenderers.Clear();
    }


    void Update()
    {
        // Wait till users pick an avatar to enable renderers.
        if (disabledRenderers.Count > 0)
        {
            if (!PlayerAvatarStore.Instance.PickerActive &&
            ImportExportAnchorManager.Instance.AnchorEstablished)
            {
                // After which we want to start rendering.
                EnableModel();

                // And if we've already been sent the relative transform, we will use it.
                if (GotTransform)
                {
                    // This triggers the animation sequence for the model and
                    // puts the cool materials on the model.
                    GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                }
            }
        }
        else if (GotTransform == false)
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        // Put the model 2m in front of the user.
        Vector3 retval = Camera.main.transform.position + Camera.main.transform.forward * 2;

        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransfrom(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the model to do its animation and
        // swap its materials.
        if (disabledRenderers.Count == 0 && GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    public void ResetStage()
    {
        // We'll use this later.
    }
}
```

-   Visual Studio で AppStateManager スクリプトを開きます。
-   コンテンツを以下のコードに置き換えます。

AppStateManager.cs
```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Keeps track of the current state of the experience.
/// </summary>
public class AppStateManager : Singleton<AppStateManager>
{
    /// <summary>
    /// Enum to track progress through the experience.
    /// </summary>
    public enum AppState
    {
        Starting = 0,
        WaitingForAnchor,
        WaitingForStageTransform,
        PickingAvatar,
        Ready
    }

    /// <summary>
    /// Tracks the current state in the experience.
    /// </summary>
    public AppState CurrentAppState { get; set; }

    void Start()
    {
        // We start in the 'picking avatar' mode.
        CurrentAppState = AppState.PickingAvatar;

        // We start by showing the avatar picker.
        PlayerAvatarStore.Instance.SpawnAvatarPicker();
    }

    void Update()
    {
        switch (CurrentAppState)
        {
            case AppState.PickingAvatar:
                // Avatar picking is done when the avatar picker has been dismissed.
                if (PlayerAvatarStore.Instance.PickerActive == false)
                {
                    CurrentAppState = AppState.WaitingForAnchor;
                }
                break;
            case AppState.WaitingForAnchor:
                if (ImportExportAnchorManager.Instance.AnchorEstablished)
                {
                    CurrentAppState = AppState.WaitingForStageTransform;
                    GestureManager.Instance.OverrideFocusedObject = HologramPlacement.Instance.gameObject;
                }
                break;
            case AppState.WaitingForStageTransform:
                // Now if we have the stage transform we are ready to go.
                if (HologramPlacement.Instance.GotTransform)
                {
                    CurrentAppState = AppState.Ready;
                    GestureManager.Instance.OverrideFocusedObject = null;
                }
                break;
        }
    }
}
```

### 配置と実行

-   プロジェクトをビルドして HoloLens デバイスに配置します。
-   ビシッという音を聞いたら、アバターを選ぶメニューに移動して、空中をタップするジェスチャーを使ってアバターを選びます。
-   ホログラムを見ていないと、HoloLens がサービスとコミュニケーションしているときに、カーソル周りの点光線がさまざまな色に変わります。初期化中は濃い紫、アンカーのダウンロード中は緑、場所データのインポートまたはエクスポート中は黄、アンカーのアップロード中は青に変わります。カーソルの周りの点光線が既定の明るい紫の場合は、セッション内で他のプレイヤーと交流する準備ができています。
-   自分の空間に接続している他のプレイヤーを見ると、肩の上に浮かび頭の動きを模倣しているホログラフィックロボットが見えます。

## 第 5 章 - 配置

この章では、アンカーを現実世界の面に配置できるようにします。ここでは共有座標系を使って共有エクスペリエンスに接続している全員の中間点にアンカーを置きます。

### 目標

-   プレイヤーの頭の位置を基に、空間マップ上にホログラムを置く。

### 手順

-   \[Project\] パネルで Holograms フォルダーに移動します。
-   CustomSpatialMapping をドラッグして、\[Hierarchy\] パネルにドロップします。
-   \[Project\] パネルで Scripts フォルダーに移動します。
-   AppStateManager スクリプトをダブルクリックして Visual Studio で開きます。
-   コンテンツを以下のコードに置き換えます。

AppStateManager.cs
```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Keeps track of the current state of the experience.
/// </summary>
public class AppStateManager : Singleton<AppStateManager>
{
    /// <summary>
    /// Enum to track progress through the experience.
    /// </summary>
    public enum AppState
    {
        Starting = 0,
        PickingAvatar,
        WaitingForAnchor,
        WaitingForStageTransform,
        Ready
    }

    // The object to call to make a projectile.
    GameObject shootHandler = null;

    /// <summary>
    /// Tracks the current state in the experience.
    /// </summary>
    public AppState CurrentAppState { get; set; }

    void Start()
    {
        // The shootHandler shoots projectiles.
        if (GetComponent<ProjectileLauncher>() != null)
        {
            shootHandler = GetComponent<ProjectileLauncher>().gameObject;
        }

        // We start in the 'picking avatar' mode.
        CurrentAppState = AppState.PickingAvatar;

        // Spatial mapping should be disabled when we start up so as not
        // to distract from the avatar picking.
        SpatialMappingManager.Instance.StopObserver();
        SpatialMappingManager.Instance.gameObject.SetActive(false);

        // On device we start by showing the avatar picker.
        PlayerAvatarStore.Instance.SpawnAvatarPicker();
    }

    public void ResetStage()
    {
        // If we fall back to waiting for anchor, everything needed to
        // get us into setting the target transform state will be setup.
        if (CurrentAppState != AppState.PickingAvatar)
        {
            CurrentAppState = AppState.WaitingForAnchor;
        }

        // Reset the underworld.
        if (UnderworldBase.Instance)
        {
            UnderworldBase.Instance.ResetUnderworld();
        }
    }

    void Update()
    {
        switch (CurrentAppState)
        {
            case AppState.PickingAvatar:
                // Avatar picking is done when the avatar picker has been dismissed.
                if (PlayerAvatarStore.Instance.PickerActive == false)
                {
                    CurrentAppState = AppState.WaitingForAnchor;
                }
                break;
            case AppState.WaitingForAnchor:
                // Once the anchor is established we need to run spatial mapping for a
                // little while to build up some meshes.
                if (ImportExportAnchorManager.Instance.AnchorEstablished)
                {
                    CurrentAppState = AppState.WaitingForStageTransform;
                    GestureManager.Instance.OverrideFocusedObject = HologramPlacement.Instance.gameObject;

                    SpatialMappingManager.Instance.gameObject.SetActive(true);
                    SpatialMappingManager.Instance.DrawVisualMeshes = true;
                    SpatialMappingDeformation.Instance.ResetGlobalRendering();
                    SpatialMappingManager.Instance.StartObserver();
                }
                break;
            case AppState.WaitingForStageTransform:
                // Now if we have the stage transform we are ready to go.
                if (HologramPlacement.Instance.GotTransform)
                {
                    CurrentAppState = AppState.Ready;
                    GestureManager.Instance.OverrideFocusedObject = shootHandler;
                }
                break;
        }
    }
}
```

-   \[Project\] パネルで Scripts フォルダーに移動します。
-   HologramPlacement スクリプトをダブルクリックして Visual Studio で開きます。
-   コンテンツを以下のコードに置き換えます。

HologramPlacement.cs
```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the model.
    /// The model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    /// <summary>
    /// When the experience starts, we disable all of the rendering of the model.
    /// </summary>
    List<MeshRenderer> disabledRenderers = new List<MeshRenderer>();

    /// <summary>
    /// We use a voice command to enable moving the target.
    /// </summary>
    KeywordRecognizer keywordRecognizer;

    void Start()
    {
        // When we first start, we need to disable the model to avoid it obstructing the user picking a hat.
        DisableModel();

        // We care about getting updates for the model transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransfrom;

        // And when a new user join we will send the model transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;

        // And if the users want to reset the stage transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.ResetStage] = this.OnResetStage;

        // Setup a keyword recognizer to enable resetting the target location.
        List<string> keywords = new List<string>();
        keywords.Add("Reset Target");
        keywordRecognizer = new KeywordRecognizer(keywords.ToArray());
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    /// <summary>
    /// When the keyword recognizer hears a command this will be called.  
    /// In this case we only have one keyword, which will re-enable moving the
    /// target.
    /// </summary>
    /// <param name="args">information to help route the voice command.</param>
    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        ResetStage();
    }

    /// <summary>
    /// Resets the stage transform, so users can place the target again.
    /// </summary>
    public void ResetStage()
    {
        GotTransform = false;

        // AppStateManager needs to know about this so that
        // the right objects get input routed to them.
        AppStateManager.Instance.ResetStage();

        // Other devices in the experience need to know about this as well.
        CustomMessages.Instance.SendResetStage();

        // And we need to reset the object to its start animation state.
        GetComponent<EnergyHubBase>().ResetAnimation();
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the model if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    /// <summary>
    /// Turns off all renderers for the model.
    /// </summary>
    void DisableModel()
    {
        foreach (MeshRenderer renderer in gameObject.GetComponentsInChildren<MeshRenderer>())
        {
            if (renderer.enabled)
            {
                renderer.enabled = false;
                disabledRenderers.Add(renderer);
            }
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = false;
        }
    }

    /// <summary>
    /// Turns on all renderers that were disabled.
    /// </summary>
    void EnableModel()
    {
        foreach (MeshRenderer renderer in disabledRenderers)
        {
            renderer.enabled = true;
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = true;
        }

        disabledRenderers.Clear();
    }


    void Update()
    {
        // Wait till users pick an avatar to enable renderers.
        if (disabledRenderers.Count > 0)
        {
            if (!PlayerAvatarStore.Instance.PickerActive &&
            ImportExportAnchorManager.Instance.AnchorEstablished)
            {
                // After which we want to start rendering.
                EnableModel();

                // And if we've already been sent the relative transform, we will use it.
                if (GotTransform)
                {
                    // This triggers the animation sequence for the model and
                    // puts the cool materials on the model.
                    GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                }
            }
        }
        else if (GotTransform == false)
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        Vector3 retval;
        // We need to know how many users are in the experience with good transforms.
        Vector3 cumulatedPosition = Camera.main.transform.position;
        int playerCount = 1;
        foreach (RemotePlayerManager.RemoteHeadInfo remoteHead in RemotePlayerManager.Instance.remoteHeadInfos)
        {
            if (remoteHead.Anchored && remoteHead.Active)
            {
                playerCount++;
                cumulatedPosition += remoteHead.HeadObject.transform.position;
            }
        }

        // If we have more than one player ...
        if (playerCount > 1)
        {
            // Put the transform in between the players.
            retval = cumulatedPosition / playerCount;
            RaycastHit hitInfo;

            // And try to put the transform on a surface below the midpoint of the players.
            if (Physics.Raycast(retval, Vector3.down, out hitInfo, 5, SpatialMappingManager.Instance.LayerMask))
            {
                retval = hitInfo.point;
            }
        }
        // If we are the only player, have the model act as the 'cursor' ...
        else
        {
            // We prefer to put the model on a real world surface.
            RaycastHit hitInfo;

            if (Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitInfo, 30, SpatialMappingManager.Instance.LayerMask))
            {
                retval = hitInfo.point;
            }
            else
            {
                // But if we don't have a ray that intersects the real world, just put the model 2m in
                // front of the user.
                retval = Camera.main.transform.position + Camera.main.transform.forward * 2;
            }
        }
        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransfrom(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the model to do its animation and
        // swap its materials.
        if (disabledRenderers.Count == 0 && GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    void OnResetStage(NetworkInMessage msg)
    {
        GotTransform = false;

        GetComponent<EnergyHubBase>().ResetAnimation();
        AppStateManager.Instance.ResetStage();
    }
}
```

### 配置と実行

-   プロジェクトをビルドして HoloLens デバイスに配置します。
-   アプリの準備ができたら、円の中に立ちます。全員の中央に EnergyHub が現れるのがわかります。
-   タップして EnergyHub を置きます。
-   EnergyHub バックアップを選ぶために、音声コマンド「Reset Target」を試します。全員がグループとして連携して、ホログラムを新しい場所に動かします。

## 第 6 章 - 現実世界の物理特性

この章では、現実世界の面から飛び出すホログラムを追加します。参加するプレイヤーが起動した各プロジェクトで空間が覆われるのを見守ります。

### 目標

-   現実世界の面から弾を打ち出す。
-   打ち出した弾が他のプレイヤーに見えるように共有する。

### 手順

-   \[Hierarchy\] パネルで HologramCollection オブジェクトを選びます。
-   \[Inspector\] パネルで \[Add Component\] をクリックします。
-   検索ボックスに「Projectile Launcher」と入力します。検索結果を選びます。

### 配置と実行

-   ビルドして HoloLens デバイスに配置します。
-   アプリが全員のデバイスで実行されている状態で、空中をタップするジェスチャーを行うと、現実世界の面から弾が打ち出されます。
-   弾が他のプレイヤーのアバターに当たると何が起こるかを確認します。

## 第 7 章 - グランドフィナーレ

この章では、協力しないと見つからない入り口を明らかにします。

### 目標

-   秘密の入り口を明らかにするために、全員で協力してアンカーで弾を打ち出す。

### 手順

-   \[Project\] パネルで Holograms フォルダーに移動します。
-   Underworld アセットをドラッグして HologramCollection の子になるようにドロップします。
-   HologramCollection を選んだ状態で、\[Inspector\] パネルの \[Add Component\] をクリックします。
-   メニューの検索ボックスに「ExplodeTarget」と入力します。検索結果を選びます。
-   HologramCollection を選んだ状態で、EnergyHub オブジェクトを\[Hierarchy\] パネルから \[Inspector\] パネルの \[Target\] フィールドにドラッグします。
-   HologramCollection を選んだ状態で、Underworld オブジェクトを\[Hierarchy\] パネルから \[Inspector\] パネルの \[Underworld\] フィールドにドラッグします。

### 配置と実行

-   ビルドして HoloLens デバイスに配置します。
-   アプリが起動したら、協力して EnergyHub に弾を打ち出します。
-   闇の世界が現れたら、闇の世界のロボットに弾を打ち出します (ロボットに3回当たるとさらに楽しみがあります)。
