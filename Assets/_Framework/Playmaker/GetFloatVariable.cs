using HutongGames.PlayMaker;

namespace _Framework.Playmaker
{
    [ActionCategory("Framework")]
    [Tooltip("Gets a float from a FloatVariable")]
    public class GetFloatVariable : FsmStateAction
    {
        [RequiredField] [ObjectType(typeof(FloatVariable))]
        public FsmObject FloatVar;

        [UIHint(UIHint.Variable)] public FsmFloat OutputFloat;

        public override void OnEnter()
        {
            OutputFloat.Value = ((FloatVariable)FloatVar.Value).Value;
        }
    }
}