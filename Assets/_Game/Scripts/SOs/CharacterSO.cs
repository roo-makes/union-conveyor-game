using System;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Game.Scripts
{
    [CreateAssetMenu(fileName = "Character", menuName = "UC/Character", order = 0)]
    public class CharacterSO : ScriptableObject
    {
        [Tooltip("Should be all caps")]
        public string Name;
        public bool IsPlayer;

        [Space]
        public Color CharacterIconColor;
        public Material CharacterIconMaterial;

        [Space]
        [PreviewField(100f)]
        public Sprite CharacterPortrait;
        public Material CharacterPortraitMaterial;

        [Space]
        public AudioClip CharacterVoice;

        [Range(0.5f, 2f)] public float CharacterVoicePitch = 1;

        private bool _isTalking;
        public event Action StartedTalking;
        public event Action StoppedTalking;

        public bool IsTalking
        {
            get => _isTalking;
            set
            {
                if (value == _isTalking) return;

                if (value)
                {
                    _isTalking = true;
                    StartedTalking?.Invoke();
                }
                else
                {
                    _isTalking = false;
                    StoppedTalking?.Invoke();
                }

            }
        }
    }
}