using System.Text;
using DG.Tweening;
using HutongGames.PlayMaker;

namespace _Game.Scripts.Dialog.Playmaker
{
    [ActionCategory("UnionConveyor")]
    public class PlayTypewriterText : FsmStateAction
    {
        [RequiredField] public FsmString FullText;

        public FsmString Separator;

        [RequiredField] public FsmInt CharsPerSecond;

        [UIHint(UIHint.Variable)] public FsmString OutputText;
        public FsmEvent OnComplete;

        private int _curPosition;
        private StringBuilder _sb;

        // Code that runs on entering the state.
        public override void OnEnter()
        {
            _curPosition = 0;
            var numChars = FullText.Value.Length;
            var tweenTime = (float)numChars / CharsPerSecond.Value;
            _sb = new StringBuilder(numChars + Separator.Value.Length);


            DOTween.To(() => _curPosition, (newPosition) => _curPosition = newPosition, numChars,
                tweenTime).SetEase(Ease.Linear);
        }

        // Code that runs every frame.
        public override void OnUpdate()
        {
            _sb.Clear();
            _sb.Append(FullText.Value.Substring(0, _curPosition));
            _sb.Append(Separator.Value);
            _sb.Append(FullText.Value.Substring(_curPosition));
            OutputText.Value = _sb.ToString();
            if (_curPosition == FullText.Value.Length)
            {
                Fsm.Event(OnComplete);
                Finish();
            }
        }

        // Code that runs when exiting the state.
        public override void OnExit()
        {
            OutputText.Value = FullText.Value;
        }
    }
}