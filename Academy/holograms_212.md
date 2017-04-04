# ホログラム 212

[*音声入力*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/voice_input)もホログラムを操作する 1 つの方法です。音声コマンドは、非常に自然かつ簡単に機能します。このチュートリアルでは、以下を目標に音声コマンドを設計します。

-   自然
-   覚えやすい
-   状況に合っている
-   同じ状況でも他のオプションと十分区別できる

[*ホログラム 101*](holograms_101.md) では、KeywordRecognizer を使って、簡単な音声コマンドを 2 つビルドしました。ホログラム 212 では、以下を行う方法について詳しく説明します。

-   HoloLens の音声エンジンに最適な音声コマンドを設計します。
-   利用可能な音声コマンドがユーザーにわかるようにします。
-   ユーザーの音声コマンドを聞き取ったことを通知します。
-   Dictation Recognizer を使って、ユーザーの発話内容を理解します。
-   Grammar Recognizer を使い、SRGS (Speech Recognition Grammar Specification) ファイルに基づいてコマンドを聞き取ります。

このチュートリアルでは、[*ホログラム 210*](holograms_210.md) と[*ホログラム 211*](holograms_211.md) でビルドした Unity プロジェクト「Model Explorer」を再び使います。

## 前提条件

-   適切な[*ツールをインストールして*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/install_the_tools)構成した Windows 10 PC。
-   ある程度基本的な C\# プログラミング能力。
-   [*ホログラム 101*](holograms_101.md) の修了。
-   [*ホログラム 210*](holograms_210.md) の修了。
-   [*ホログラム 211*](holograms_211.md) の修了。
-   [*開発用に構成した*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#enabling_developer_mode) HoloLens デバイス。

**プロジェクト ファイル**

-   プロジェクトに必要な[*ファイル*](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-212-Voice.zip)はダウンロードします。Unity 5.5 が必要です。
    -   依然として Unity 5.4 のサポートが必要な場合は、[*こちらのリリース*](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-212.zip)を使用してください。
-   デスクトップなどのアクセスしやすい場所にファイルを解凍します。

## 正誤表と注意事項

-   コードをブレークポイントで停止するには、\[ツール\]、\[オプション\]、\[デバッグ\] の順に選び、\[マイ コードのみ\] を無効にする (チェック ボックスをオフにする) 必要があります。

## チュートリアルの内容

-   [Unity のセットアップ](holograms_212.md#unity-のセットアップ)
-   [第 1 章 – 認知](holograms_212.md#第-1-章--認知)
-   [第 2 章 – 確認応答](holograms_212.md#第-2-章--確認応答)
-   [第 3 章 - 理解と Dictation Recognizer](holograms_212.md#第-3-章---理解と-dictation-recognizer)
-   [第 4 章 - Grammar Recognizer](holograms_212.md#第-4-章---grammar-recognizer)
-   [終わりに](holograms_212.md#終わりに)

## Unity のセットアップ

### 手順

-   Unity を起動します。
-   \[Open\] を選びます。
-   デスクトップに移動し、最初に解凍した HolographicAcademy-Holograms-212-Voice フォルダーを探します。
-   Starting フォルダーに移動し、ModelExplorer フォルダーを選びます。
-   \[Select Folder\] をクリックします。
-   \[Project\] パネルで Scenes フォルダーをクリックします。
-   ModelExplorer シーンをダブルクリックして、Unity で開きます。
-   Unity で、\[File\] 、\[Build Settings\] の順に選びます。
-   \[Scenes In Build\] の一覧に \[Scenes/ModelExplorer\] がない場合は、\[Add Open Scenes\] をクリックして、シーンを追加します。
-   \[Platform\] の一覧で \[Windows Store\] を選び、\[Switch Platform\] をクリックします。
-   \[SDK\] を \[Universal 10\] に、\[UWP Build Type\] を \[D3D\] に設定します。
-   \[Unity C\# Projects\] チェック ボックスをオンにします。
-   \[Build\] をクリックします。
-   \[New Folder\] をクリックし、フォルダーに「App」という名前を付けます。
-   \[App\] フォルダーをシングル クリックします。
-   \[Select Folder\] をクリックします。
-   Unity を終了すると、エクスプローラー ウィンドウが表示されます。
-   App フォルダーを開きます。
-   Visual Studio ソリューション「ModelExplorer」を開きます。
-   Visual Studio 上部のツール バーを使って、ターゲットを \[Debug\] から \[Release\]、\[ARM\] から \[X86\] に変更します。
-   \[デバイス\] ボタンの横にある矢印をクリックして、\[リモート コンピューター\] を選びます。
-   デバイスの IP アドレスを入力して、\[認証モード\] を \[ユニバーサル (暗号化されていないプロトコル)\] に設定します。\[選択\] をクリックします。デバイスの IP アドレスがわからない場合は、\[設定\]、\[ネットワークとインターネット\]、\[詳細オプション\] の順にクリックして IP アドレスを確認するか、Cortana に「Hey Cortana, what's my IP address?」と質問します。
-   メニューで \[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。デバイスに初めて配置する場合は、Visual Studio とのペアリングが必要です。以下の「[*HoloLens と Visual Studio のペアリング*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Using_Visual_Studio.html#pairing_your_device)」の指示に従います。
-   **メモ:** Visual Studio の \[エラー\] パネルに、赤でエラーがいくつか表示されることがあります。これらのエラーは無視しても問題は生じません。\[出力\] パネルに切り替えて、実際のビルドの進捗状況を表示します。\[出力\] パネルにエラーが表示される場合は解決する必要があります (エラーの原因はほぼスクリプト内でのミスによるものです)。

## 第 1 章 – 認知

### 目標

-   音声コマンド設計時に「行うこと」と「行わないこと」を学ぶ。
-   視線ベースの音声コマンドの追加に KeywordRecognizer を使う。
-   カーソル フィードバックを使用して、ユーザーに音声コマンドを認知させる。

ここでは、音声コマンドの設計について説明します。音声コマンドを作成するときは、以下のことを意識します。

### 「行うこと」

-   簡潔なコマンドを作成します。「Play the currently selected video」 といったコマンドは簡潔ではなく、ユーザーはすぐに忘れてしまうため、使いません。代わりに、「Play Video」のような複数音節の簡潔なコマンドにします。
-   簡単なボキャブラリーを使用します。常に、よく使う言葉や文を使うよう心がけます。ユーザーにとってわかりやすく、覚えやすいものにします。たとえば、アプリでメモ オブジェクトを表示したり、非表示にする場合、「Show Placard」 のようなコマンドにはしません。「Placard」 はめったに使わない言葉です。代わりに、アプリでメモを表示するコマンドは「Show Note」 にします。
-   一貫性を保ちます。音声コマンドは、アプリ全体で一貫性を保つようにします。アプリに 2 つのシーンがあり、どちらのシーンにもアプリを閉じるボタンがあるとします。このボタンをトリガーするのに、一方のシーンでは「Exit」というコマンドを使い、もう一方では「Close App」というコマンドを使うと、ユーザーは混乱します。複数のシーンに同じ機能が存在する場合は、同じ音声コマンドを使ってその機能トリガーするようにします。

### 「行わないこと」

-   単一音節のコマンドは使用しません。たとえば、ビデオを再生する音声コマンドを作成する場合、「Play」 というコマンドは使用しません。単一音節のコマンドは、システムが誤認識しやすいためです。代わりに、「Play Video」 といった簡潔でありながら、複数音節のコマンドにします。
-   システム コマンドは使用しません。「Select」 コマンドはシステムで予約されており、現在フォーカスが設定されているオブジェクトの Tap イベントをトリガーします。予期しない動作をする可能性があるため、キーワードやフレーズに「Select」 コマンドを再利用するのは避けます。たとえば、アプリでキューブを選択する音声コマンドを「Select cube」 にしても、ユーザーが球体を見ながらそのコマンドを発話すると、代わりに球体が選択されることになります。同様に、アプリのバー コマンドも音声に対応しています。CoreWindow ビューの以下の音声コマンドは使用しないようにします。

    1.  Go Back
    2.  Scroll Tool
    3.  Zoom Tool
    4.  Drag Tool
    5.  Adjust
    6.  Remove

-   同じ音は使用しません。韻を踏む音声コマンドは使用しないようにします。ショッピング アプリで音声コマンドとして「Show Store」 と「Show More」 をサポートする場合は、一方のコマンドの使用中はもう一方のコマンドを無効にすることを考えます。たとえば、「Show Store」 でストアを開き、ストアが表示されたらこれを無効にして、「Show More」 を有効にして表示件数を増やせるようにします。

### 手順

-   Unity の Hierarchy\] パネルで検索ツールを使って holoComm\_screen\_mesh オブジェクトに移動し、選びます。
-   holoComm\_screen\_mesh オブジェクトをダブルクリックして、\[Scene\] で表示します。これは宇宙飛行士の腕時計で、今回の音声コマンドに反応します。
-   \[Inspector\] パネルで \[Keyword Manager (Script)\] コンポーネントに移動します。
-   \[Keywords and Responses\] セクションを展開して、サポート対象の音声コマンド「Open Communicator」 を確認します。
-   KeywordManager をダブルクリックして Visual Studio で開きます。
-   KeywordManager.cs を調べて、KeywordRecognizer を使って音声コマンドを追加する方法と、デリゲートを使ってコマンドに応答する方法を理解します。

### ビルドと配置

-   Unity で、\[File\] 、\[Build Settings\] の順に選んで、アプリをリビルドします。
-   App フォルダーを開きます。
-   Visual Studio ソリューション「ModelExplorer」を開きます。

(セットアップ中にこのプロジェクトを Visual Studio で既にビルドして配置した場合は、VS のインスタンスを開いて、メッセージが表示されたときに \[再読み込み\] をクリックします)

-   Visual Studio で 、\[デバッグ\]、\[デバッグなしで開始\] の順に選ぶか、**Ctrl** キーを押しながら **F5** キーを押します。
-   アプリを HoloLens に配置したら、[*空中をタップする*](https://developer.microsoft.com/ja-jp/windows/mixed-reality/Gestures.html#press_and_release)ジェスチャーを使って Fitbox を消去します。
-   宇宙飛行士の腕時計に視線を送ります。
-   腕時計にフォーカスが設定されると、カーソルがマイクに変わることを確認します。これにより、アプリが音声コマンドをリッスンしていることを示すフィードバックが提供されます。
-   腕時計にツールチップが表示されることを確認します。これにより、ユーザーは「Open Communicator」 コマンドを認知できます。
-   腕時計に視線を送りながら、「Open Communicator」 と発話して、コミュニケーター パネルを開きます。

## 第 2 章 – 確認応答

### 目標

-   マイク入力を使ってメッセージを録音する。
-   アプリが音声コマンドをリッスンしていることをユーザーにフィードバックとして提供する。

### メモ

アプリでマイクを使って録音するには、Microphone 機能を宣言する必要があります。ホログラム 212 ではこの宣言を既に行っていますが、独自にプロジェクトを開発する場合は忘れないようにしてください。

1.  Unity のエディターで、\[Edit\] 、\[Project Settings\] 、\[Player\] の順に選び、プレイヤーの設定に移動します。
2.  \[Windows Store\] タブをクリックします。
3.  \[Publishing Settings\] の \[Capabilities\] セクションで、\[Microphone\] 機能のチェック ボックスをオンにします。

### 手順

-   Unity の \[Hierarchy\] パネルで holoComm\_screen\_mesh オブジェクトが選択されていることを確認します。
-   \[Inspector\] パネルの \[Astronaut Watch (Script)\] コンポーネントに移動します。
-   小さな青いキューブをクリックし、\[Communicator Prefab\] プロパティの値として設定します。
-   これで \[Project\] パネルの \[Communicator Prefab\] にフォーカスが設定されます。
-   \[Project\] パネルの \[Communicator Prefab\] をクリックして、そのコンポーネントを \[Inspector\] パネルに表示します。
-   \[Microphone Manager (Script)\] コンポーネントを確認します。このコンポーネントによって、ユーザーの音声を録音できるようになります。
-   Communicator オブジェクトに 「Send Message」 コマンドに応答する \[Keyword Manager (Script)\] コンポーネントがあるのがわかります。
-   \[Communicator (Script)\] コンポーネントに移動し、このスクリプトをダブルクリックして Visual Studio で開きます。

Communicator.cs には、コミュニケーター デバイスのボタンの状態を正しく設定する役割があります。これにより、ユーザーはメッセージを録音し、それを再生して、そのメッセージを宇宙飛行士に送ることができます。また、波形のアニメーションを再生および停止して、音声が聞こえたことを伝える確認応答をユーザーに返します。

-   Communicator.cs の Start メソッドから以下の行を削除します。これで、コミュニケーターの \[Record\] ボタンが有効になります。

Communicator.cs
```cs
// TODO: 2.a Delete the following two lines:
RecordButton.SetActive(false);
MessageUIRenderer.gameObject.SetActive(false);
```

### ビルドと配置

-   Visual Studio でアプリをリビルドしてデバイスに配置します。
-   宇宙飛行士の腕時計に視線を送り、「Open Communicator」 と発話して、コミュニケーターを表示します。
-   \[Record\] ボタン (マイク) を押して、宇宙飛行士へ口頭で送るメッセージの録音を始めます。
-   発話を始めて、コミュニケーターで波形のアニメーションが再生されるのを確認します。このアニメーションは、音声が聞こえていることをフィードバックとしてユーザーに提供します。
-   停止ボタン (左の四角形) を押して、波形アニメーションが停止するのを確認します。
-   再生ボタン (右の三角形) を押して、録音したメッセージを再生してデバイスで聞きます。
-   停止ボタン (右の四角形) を押して、録音したメッセージの再生を停止します。
-   「Send Message」 と発話してコミュニケーターを閉じ、宇宙飛行士から「Message Received」 という応答を受け取ります。

## 第 3 章 - 理解と Dictation Recognizer

### 目標

-   ユーザーの発話内容をテキストに変換するために、Dictation Recognizer を使う。
-   Dictation Recognizer の仮説と最終結果をコミュニケーターに表示する。

この章では、Dictation Recognizer を使って、宇宙飛行士向けにメッセージを作成します。Dictation Recognizer を使うときは、以下のことに気をつけます。

-   Dictation Recognizer を機能させるには Wi-Fi 接続が必要です。
-   一定時間後にタイムアウトが発生します。注意するタイムアウトは以下の 2 つです。
    -   レコグナイザーが起動して最初の 5 秒間にオーディオが聞こえなければタイムアウトします。
    -   レコグナイザーが結果を提示後 20 秒間何も聞こえなければタイムアウトします。
-   一度に実行できるレコグナイザーは 1 種類 (Keyword または Dictation) のみです。

### メモ

アプリでマイクを使って録音するには、Microphone 機能を宣言する必要があります。ホログラム 212 ではこの宣言を既に行っていますが、独自にプロジェクトを開発する場合は忘れないようにしてください。

1.  Unity のエディターで、\[Edit\] 、\[Project Settings\]、\[Player\] の順に選び、プレイヤーの設定に移動します。
2.  \[Windows Store\] タブをクリックします。
3.  \[Publishing Settings\] の \[Capabilities\] セクションで、\[Microphone\] 機能のチェック ボックスをオンにします。

### 手順

ここでは Dictation Recognizer を使うように MicrophoneManager.cs を編集します。以下を追加します。

1.  \[Record\] ボタンが押されたときに、DictationRecognizer を起動します。
2.  DictationRecognizer が理解した仮説を表示します。
3.  DictationRecognizer が理解した結果をロックします。
4.  DictationRecognizer のタイムアウトをチェックします。
5.  停止ボタンが押されたら (マイク セッションがタイムアウトしたら) と、DictationRecognizer を停止します。
6.  KeywordRecognizer を再起動します。これにより、「Send Message」 コマンドがリッスンされるようになります。

では、始めましょう。

-   MicrophoneManager.cs で「3.a」で示した部分のコーディングをすべて完成するか、以下の完成版コードをコピーして貼り付けます。

MicrophoneManager.cs
```cs
using Academy.HoloToolkit.Unity;
using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Windows.Speech;

public class MicrophoneManager : MonoBehaviour
{
    [Tooltip("A text area for the recognizer to display the recognized strings.")]
    public Text DictationDisplay;

    private DictationRecognizer dictationRecognizer;

    // Use this string to cache the text currently displayed in the text box.
    private StringBuilder textSoFar;

    // Using an empty string specifies the default microphone.
    private static string deviceName = string.Empty;
    private int samplingRate;
    private const int messageLength = 10;

    // Use this to reset the UI once the Microphone is done recording after it was started.
    private bool hasRecordingStarted;

    void Awake()
    {
        /* TODO: DEVELOPER CODING EXERCISE 3.a */

        // 3.a: Create a new DictationRecognizer and assign it to dictationRecognizer variable.
        dictationRecognizer = new DictationRecognizer();

        // 3.a: Register for dictationRecognizer.DictationHypothesis and implement DictationHypothesis below
        // This event is fired while the user is talking. As the recognizer listens, it provides text of what it's heard so far.
        dictationRecognizer.DictationHypothesis += DictationRecognizer_DictationHypothesis;

        // 3.a: Register for dictationRecognizer.DictationResult and implement DictationResult below
        // This event is fired after the user pauses, typically at the end of a sentence. The full recognized string is returned here.
        dictationRecognizer.DictationResult += DictationRecognizer_DictationResult;

        // 3.a: Register for dictationRecognizer.DictationComplete and implement DictationComplete below
        // This event is fired when the recognizer stops, whether from Stop() being called, a timeout occurring, or some other error.
        dictationRecognizer.DictationComplete += DictationRecognizer_DictationComplete;

        // 3.a: Register for dictationRecognizer.DictationError and implement DictationError below
        // This event is fired when an error occurs.
        dictationRecognizer.DictationError += DictationRecognizer_DictationError;

        // Query the maximum frequency of the default microphone. Use 'unused' to ignore the minimum frequency.
        int unused;
        Microphone.GetDeviceCaps(deviceName, out unused, out samplingRate);

        // Use this string to cache the text currently displayed in the text box.
        textSoFar = new StringBuilder();

        // Use this to reset the UI once the Microphone is done recording after it was started.
        hasRecordingStarted = false;
    }

    void Update()
    {
        // 3.a: Add condition to check if dictationRecognizer.Status is Running
        if (hasRecordingStarted && !Microphone.IsRecording(deviceName) && dictationRecognizer.Status == SpeechSystemStatus.Running)
        {
            // Reset the flag now that we're cleaning up the UI.
            hasRecordingStarted = false;

            // This acts like pressing the Stop button and sends the message to the Communicator.
            // If the microphone stops as a result of timing out, make sure to manually stop the dictation recognizer.
            // Look at the StopRecording function.
            SendMessage("RecordStop");
        }
    }

    /// <summary>
    /// Turns on the dictation recognizer and begins recording audio from the default microphone.
    /// </summary>
    /// <returns>The audio clip recorded from the microphone.</returns>
    public AudioClip StartRecording()
    {
        // 3.a Shutdown the PhraseRecognitionSystem. This controls the KeywordRecognizers
        PhraseRecognitionSystem.Shutdown();

        // 3.a: Start dictationRecognizer
        dictationRecognizer.Start();

        // 3.a Uncomment this line
        DictationDisplay.text = "Dictation is starting. It may take time to display your text the first time, but begin speaking now...";

        // Set the flag that we've started recording.
        hasRecordingStarted = true;

        // Start recording from the microphone for 10 seconds.
        return Microphone.Start(deviceName, false, messageLength, samplingRate);
    }

    /// <summary>
    /// Ends the recording session.
    /// </summary>
    public void StopRecording()
    {
        // 3.a: Check if dictationRecognizer.Status is Running and stop it if so
        if (dictationRecognizer.Status == SpeechSystemStatus.Running)
        {
            dictationRecognizer.Stop();
        }

        Microphone.End(deviceName);
    }

    /// <summary>
    /// This event is fired while the user is talking. As the recognizer listens, it provides text of what it's heard so far.
    /// </summary>
    /// <param name="text">The currently hypothesized recognition.</param>
    private void DictationRecognizer_DictationHypothesis(string text)
    {
        // 3.a: Set DictationDisplay text to be textSoFar and new hypothesized text
        // We don't want to append to textSoFar yet, because the hypothesis may have changed on the next event
        DictationDisplay.text = textSoFar.ToString() + " " + text + "...";
    }

    /// <summary>
    /// This event is fired after the user pauses, typically at the end of a sentence. The full recognized string is returned here.
    /// </summary>
    /// <param name="text">The text that was heard by the recognizer.</param>
    /// <param name="confidence">A representation of how confident (rejected, low, medium, high) the recognizer is of this recognition.</param>
    private void DictationRecognizer_DictationResult(string text, ConfidenceLevel confidence)
    {
        // 3.a: Append textSoFar with latest text
        textSoFar.Append(text + ". ");

        // 3.a: Set DictationDisplay text to be textSoFar
        DictationDisplay.text = textSoFar.ToString();
    }

    /// <summary>
    /// This event is fired when the recognizer stops, whether from Stop() being called, a timeout occurring, or some other error.
    /// Typically, this will simply return "Complete". In this case, we check to see if the recognizer timed out.
    /// </summary>
    /// <param name="cause">An enumerated reason for the session completing.</param>
    private void DictationRecognizer_DictationComplete(DictationCompletionCause cause)
    {
        // If Timeout occurs, the user has been silent for too long.
        // With dictation, the default timeout after a recognition is 20 seconds.
        // The default timeout with initial silence is 5 seconds.
        if (cause == DictationCompletionCause.TimeoutExceeded)
        {
            Microphone.End(deviceName);

            DictationDisplay.text = "Dictation has timed out. Please press the record button again.";
            SendMessage("ResetAfterTimeout");
        }
    }

    /// <summary>
    /// This event is fired when an error occurs.
    /// </summary>
    /// <param name="error">The string representation of the error reason.</param>
    /// <param name="hresult">The int representation of the hresult.</param>
    private void DictationRecognizer_DictationError(string error, int hresult)
    {
        // 3.a: Set DictationDisplay text to be the error string
        DictationDisplay.text = error + "\nHRESULT: " + hresult;
    }

    private IEnumerator RestartSpeechSystem(KeywordManager keywordToStart)
    {
        while (dictationRecognizer != null && dictationRecognizer.Status == SpeechSystemStatus.Running)
        {
            yield return null;
        }

        keywordToStart.StartKeywordRecognizer();
    }
}
```

### ビルドと配置

-   Visual Studio でアプリをリビルドしてデバイスに配置します。
-   空中をタップするジェスチャーを使って Fitbox を消去します。
-   宇宙飛行士の腕時計に視線を送り、「Open Communicator」 と発話します。
-   \[Record\] ボタン (マイク) を選んで、メッセージを録音します。
-   話し始めます。Dictation Recognizer が発話内容を翻訳するため、その仮説テキストをコミュニケーターに表示します。
-   メッセージの録音中に、「Send Message」 と発話してみます。Dictation Recognizer がアクティブなので、Keyword Recognizer は応答しないことがわかります。
-   数秒間発話を止めます。Dictation Recognizer が仮説を完成し、最終結果が表示されるのを見守ります。
-   話し始めてから、20 秒間発話を一時停止します。この動作により、Dictation Recognizer がタイムアウトします。
-   このタイムアウト後に、Keyword Recognizer が再び有効になるのがわかります。これにより、コミュニケーターは音声コマンドに反応するようになります。
-   「Send Message」 と発話して、宇宙飛行士にメッセージを送ります。

## 第 4 章 - Grammar Recognizer

### 目標

-   SRGS (Speech Recognition Grammar Specification) ファイルに基づいてユーザーの発話内容を認識するために、Grammar Recognizer を使う。

### メモ

アプリでマイクを使って録音するには、Microphone 機能を宣言する必要があります。ホログラム 212 ではこの宣言を既に行っていますが、独自にプロジェクトを開発する場合は忘れないようにしてください。

1.  Unity のエディターで、\[Edit\] 、\[Project Settings\] 、\[Player\] の順に選び、プレイヤーの設定に移動します。
2.  \[Windows Store\] タブをクリックします。
3.  \[Publishing Settings\] の \[Capabilities\] セクションで、\[Microphone\] 機能のチェック ボックスをオンにします。

### 手順

1.  \[Hierarchy\] パネルで Jetpack\_Center に移動して選びます。
2.  \[Inspector\] パネルの Interactible Action スクリプトに移動します。
3.  \[Object To Tag Along\] フィールドの右にある小さな円をクリックします。
4.  ポップアップ ウィンドウで SRGSToolbox を探して一覧から選びます。
5.  StreamingAssets フォルダーにある SRGSColor.xml
    ファイルを確認します。

-   SRGS の設計仕様については、W3C の [*Web サイト (英語)*](https://www.w3.org/TR/speech-grammar/) を参照してください。
-   今回の SRGS ファイルには以下の 3 種類の規則があります。
    -   12 種類の色の一覧から 1 つの色を選ばせる規則。
    -   色の規則と 3 つの図形のうちのいずれか 1 つの組み合わせをリッスンする 3 つの規則。
    -   基本規則の「colorChooser」。この規則により、3 つの「色と図形」の規則の任意の組み合わせをリッスンします。図形は任意の順序で発話することができます。1 つだけを発話することも 3 つすべてを発話することもできます。ファイルの先頭に置く最初の <grammar> タグ内で基本規則として指定すると、これがリッスンされる唯一の規則になります。

### ビルドと配置

-   Unity でアプリをリビルド後、Visual Studio でビルドして配置し、HoloLens でアプリを実行します。
-   空中をタップするジェスチャーを使って Fitbox を消去します。
-   宇宙飛行士のジェットパックに視線を送り、空中をタップするジェスチャーを行います。
-   話し始めます。Grammar Recognizer によって発話内容が翻訳され、その認識内容に基づいて図形の色が変化します。たとえば、「blue circle, yellow square」 といったコマンドを発話します。
-   空中をタップするジェスチャーを再度行い、ツールボックスを消去します。

## 終わりに

お疲れ様でした。これでチュートリアル「ホログラム 212 - 音声」は終わりです。

-   音声コマンド設計時の「行うこと」と「行わないこと」を学びました。
-   ツールチップを採用し、音声コマンドをユーザーに認知させることを学びました。
-   ユーザーの音声を聞き取ったという確認応答に使用するフィードバックを数種類学びました。
-   Keyword Recognizer と Dictation Recognizer を切り替える方法と、この 2 つの機能が音声を理解および解釈するしくみを学びました。
-   SRGS ファイルと Grammar Recognizer を使って、アプリで音声認識を使用する方法を学びました。
