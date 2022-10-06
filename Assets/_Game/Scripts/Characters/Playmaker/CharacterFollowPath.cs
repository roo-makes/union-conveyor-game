using System.Linq;
using System.Text;
using _Game.Scripts.Characters;
using DG.Tweening;
using HutongGames.PlayMaker;
using UnityEngine;

namespace _Game.Scripts.Dialog.Playmaker
{
    [ActionCategory("UnionConveyor")]
    public class CharacterFollowPath : FsmStateAction
    {
        [RequiredField] [ObjectType(typeof(CharacterMovementController))]
        public FsmObject Character;

        [RequiredField]
        [ArrayEditor(typeof(Transform))]
        [ObjectType(typeof(Transform))]
        public FsmArray Waypoints;

        public FsmEvent OnComplete;

        public FsmBool FinishImmediately;

        private CharacterMovementController _character;

        // Code that runs on entering the state.
        public override void OnEnter()
        {
            _character = (CharacterMovementController)Character.Value;

            var waypointTransforms = Waypoints.objectReferences.Select(waypoint => (Transform)waypoint).ToArray();
            
            _character.FollowPathAlt(waypointTransforms);
            _character.OnCompletedPath += OnPathComplete;

            if (FinishImmediately.Value)
            {
                Finish();
            }
        }

        private void OnPathComplete()
        {
            Fsm.Event(OnComplete);
            if (!FinishImmediately.Value)
            {
                Finish();
            }
        }


        // Code that runs when exiting the state.
        public override void OnExit()
        {
            _character.OnCompletedPath -= OnPathComplete;
        }
    }
}