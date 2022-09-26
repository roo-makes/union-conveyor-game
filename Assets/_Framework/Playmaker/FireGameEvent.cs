using HutongGames.PlayMaker;

namespace _Framework.Playmaker
{
    [ActionCategory("Framework")]
    [Tooltip(
        "Fires a GameEvent")]
    public class FireGameEvent : FsmStateAction
    {
        [RequiredField] [ObjectType(typeof(GameEvent))]
        public FsmObject GameEvent;

        // Code
        // that runs on entering the state.
        public override void OnEnter()
        {
            if (GameEvent.IsNone) return;
            var gameEvent = (GameEvent)GameEvent.Value;
            gameEvent.Raise();
            Finish();
        }
    }
}